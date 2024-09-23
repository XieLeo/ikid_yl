#include "localization_pkg/localization.h"

#include <Eigen/Core>
#include <Eigen/Geometry>
#include <ros/init.h>
#include <eigen_conversions/eigen_msg.h>

#include <boost/foreach.hpp>
#include <geometry_msgs/PoseArray.h>


#include <localization_pkg/ParticleSet.h>

static gsl_rng *allocate_rng()
{
	gsl_rng_env_setup();
	const gsl_rng_type *T = gsl_rng_default;
	gsl_rng *rng = gsl_rng_alloc(T);
	gsl_rng_set(rng, (unsigned long)time(NULL));

	return rng;
}
//用于一开始的粒子初始化
UniformParticleInitializer::UniformParticleInitializer()
{
	m_rng = allocate_rng();

	m_field = field_model::FieldModel::getInstance();
}

UniformParticleInitializer::~UniformParticleInitializer()
{
	gsl_rng_free(m_rng);
}

void UniformParticleInitializer::initParticle(
	ParticleFilterT::InitializerT::ParticleT &particle)
{
	// float fl = m_field->length() + 1.0;
	// float fw = m_field->width() + 1.0;

	float fl = m_field->length() / 1.5; // 6.2减小范围
    float fw = m_field->width() / 1.5;

	particle.setState(Vec3f(
		-fl / 2.0 + fl * gsl_rng_uniform(m_rng),
		-fw / 2.0 + fw * gsl_rng_uniform(m_rng),
		-M_PI + 2.0 * M_PI * gsl_rng_uniform(m_rng)));

	particle.getUserData() = Eigen::Rotation2D<float>(particle.getState().z());
}
//用于处理信息更新后的粒子初始化
PoseParticleInitializer::PoseParticleInitializer(
	const Vec3f &pose, const Vec3f &stddev)
	: m_pose(pose), m_stddev(stddev), m_field(field_model::FieldModel::getInstance())
{
	m_rng = allocate_rng();
}

PoseParticleInitializer::~PoseParticleInitializer()
{
	gsl_rng_free(m_rng);
}

void PoseParticleInitializer::initParticle(
	PoseParticleInitializer::ParticleT &particle)
{
	particle.setState(Vec3f(
		m_pose.x() + gsl_ran_gaussian(m_rng, m_stddev.x()),
		m_pose.y() + gsl_ran_gaussian(m_rng, m_stddev.y()),
		picut(m_pose.z() + gsl_ran_gaussian(m_rng, m_stddev.z()))));

	particle.getUserData() = Eigen::Rotation2D<float>(particle.getState().z());
}

////////////////////////////////////////////////////////////////////////////////
// Motion model

OdometryModel::OdometryModel()
{
	// Covariance matrix (x, y, theta)
	// m_A << 0.2, 0.02, 0.2 / M_PI,
	// 	0.02, 0.2, 0.2 / M_PI,
	// 	0.4, 0.4, 0.2f;

	m_A << 0.1, 0.01, 0.1 / M_PI,  // 6.2减小噪声
           0.01, 0.1, 0.1 / M_PI,
           0.2, 0.2, 0.1f;

	m_rng = allocate_rng();
}

OdometryModel::~OdometryModel()
{
}

Vec3f OdometryModel::sampleState(const Vec3f &lastPose,
								 const Vec3f &controlInput, float delta_t)
{
	delta_t = 0.1;
	Vec3f mod_deltaT(delta_t, delta_t, 1.57 * delta_t);
	Vec3f abs_input = controlInput.array().abs();

	// Since we want the standard deviation to be greater than zero even
	// if we are not moving, use a sum of the elapsed time and the
	// supposedly covered distance.

	Vec3f std_dev = 0.5 * mod_deltaT + 0.1 * m_A * abs_input;

	Vec3f noisyControlInput = controlInput + Vec3f(
												 gsl_ran_gaussian(m_rng, std_dev.x()),
												 gsl_ran_gaussian(m_rng, std_dev.y()),
												 gsl_ran_gaussian(m_rng, std_dev.z()));

	Vec2f dPose = noisyControlInput.head<2>();
	dPose = Eigen::Rotation2D<float>(lastPose.z()) * dPose;

	return Vec3f(
		lastPose.x() + dPose.x(),
		lastPose.y() + dPose.y(),
		picut(lastPose.z() + noisyControlInput.z()));
}

////////////////////////////////////////////////////////////////////////////////
// Observation model

ObservationModel::ObservationModel(LocalizationPF *pf)
	: m_pf(pf)
	, m_field(field_model::FieldModel::getInstance())
	, m_std_angle("observation/std_angle", 0.0, 0.001, 1.0, 0.2)
	, m_std_distance("observation/std_distance", 0.0, 0.001, 2.0, 0.5)
	, m_std_compass("observation/std_compass", 0.0, 0.001, 2.0, M_PI / 4.0)
	, m_alpha_uniform_base("observation/alpha_uniform_base", 0.0, 0.001, 2.0, 0.2)
{
	boost::function<void(float)> cb = boost::bind(&ObservationModel::updateVariances, this);
	m_std_angle.setCallback(cb);
	m_std_distance.setCallback(cb);
	m_std_compass.setCallback(cb);
	updateVariances();
}

ObservationModel::~ObservationModel()
{
}

void ObservationModel::updateVariances()
{
	m_var_angle = m_std_angle() * m_std_angle();
	m_var_distance = m_std_distance() * m_std_distance();
	m_var_compass = m_std_compass() * m_std_compass();

	m_3var_compass = 9.0 * m_var_compass;
}

void ObservationModel::precalculateVariances(LandmarkObservation &obs)
{
	const double max_2range = 2.0 * 10.0;
	const double max_2range_inv = 1.0 / max_2range;
	const double pi2_inv = 0.5 / M_PI;

	double alpha_uniform = m_alpha_uniform_base() + (1.0 - m_alpha_uniform_base()) * (1.0 - obs.confidence());

	// 	double alpha_exp = 1.0 - alpha_uniform;

	double std_range = m_std_distance() + 0.25 * obs.distance();
	obs.m_var_distance = std_range * std_range;
	obs.m_var_angle = m_var_angle;

	obs.m_3var_distance = 9.0 * obs.m_var_distance;
	obs.m_3var_angle = 9.0 * obs.m_var_angle;

	obs.m_alpha_exp = 1.0 - alpha_uniform;
	obs.m_alphauniform_X_max2rangeinv_X_pi2inv = alpha_uniform * max_2range_inv * pi2_inv;
}

Likelihood ObservationModel::minAndLikelihood(
	const ObservationModel::ParticleT &particle, const LandmarkObservation &observation)
{
	Likelihood mal;

	mal.mahal_dist = likelihood(particle, observation);
	mal.min_mahal_dist = minLikelihood(particle, observation);

	return mal;
}

// Attention: Apperently this returns the mahalanobis distance at the moment...
//observation是观测的信息
//obj是场地预定义的
double ObservationModel::likelihood(
	const ObservationModel::ParticleT &particle, const LandmarkObservation &observation)
{

	// 	if(observation.isCompass())
	// 	{
	// 		float cmp_expected = -particle.getState().z();
	// 		float cmp_innov = picut(observation.angle() - cmp_expected);
	//
	// 		return 0.5 * cmp_innov*cmp_innov / observation.m_var_compass;
	// 	}

	const field_model::WorldObject *obj = observation.associatedObject();

	if (!obj)
	{
		fprintf(stderr, "Warning: object without assoc\n");
		return INT_MAX; // TODO: why INT_MAX?????
	}

	double mahal_dist = 0.0;

	// Case for landmarks with a known pose
	if (!isnan(obj->pose().x()) && !isnan(obj->pose().y()))
	{
		// 打印粒子和地标对象的坐标
		// std::cout << "Particle State: (" 
		//           << particle.getState().x() << ", " 
		//           << particle.getState().y() << ", " 
		//           << particle.getState().z() << ")" << std::endl;

		// std::cout << "Object Position: (" 
		//           << obj->pose().x() << ", " 
		//           << obj->pose().y() << ", " 
		//           << obj->pose().z() << ")" << std::endl;

		Vec2f expCart = obj->pose().head<2>().cast<float>() - particle.getState().head<2>();

		expCart = particle.getUserData().transpose() * expCart;



		if (observation.distance() < 7.0)//5.31edit 4.0
		{
			float bearing_innov = picut(
				observation.angle() - atan2(expCart.y(), expCart.x()));
			mahal_dist += 0.5 * bearing_innov * bearing_innov / observation.m_var_angle;

			double range_innov = observation.distance() - expCart.norm();
			mahal_dist += 0.5 * range_innov * range_innov / observation.m_var_distance;
			// std::cout<<"range_innov"<<range_innov<<std::endl;
			// std::cout<<"observation.m_var_distance"<<observation.m_var_distance<<std::endl;
		}
	}

	// Case for landmarks with a known orientation
	if (!isnan(obj->pose().z()) && !isnan(observation.pose().z()))
	{
		float expAngle = obj->pose().z() - particle.getState().z();

		float orient_innov = picut(observation.pose().z() - expAngle);
		mahal_dist += 0.5 * orient_innov * orient_innov / m_var_compass;
	}

	return mahal_dist;
}

double ObservationModel::likelihoodDiscount(const LandmarkObservation &observation)
{
	double start = 0.4;

	switch (observation.type())
	{
	case field_model::WorldObject::Type_XMarker:
		return start * 0.9;
	case field_model::WorldObject::Type_GoalPost:
		return start * 0.6;

	// Trust L, T Xings less than X Xings.
	case field_model::WorldObject::Type_LineXingL:
		return start * 0.7;
	case field_model::WorldObject::Type_LineXingT:
		return start * 0.8;
	case field_model::WorldObject::Type_LineXingX:
		return start * 0.9;

	default:
		return start;
	}
}

double ObservationModel::minLikelihood(
	const ObservationModel::ParticleT &particle, const LandmarkObservation &observation)
{
	const field_model::WorldObject *obj = observation.associatedObject();

	if (!obj)
		return INT_MAX; // TODO: why INT_MAX?????

	double min_mahal_dist = 0.0;

	if (!isnan(obj->pose().x()) && !isnan(obj->pose().y()))
	{
		min_mahal_dist += 0.5 * observation.m_3var_distance / observation.m_var_distance;
		min_mahal_dist += 0.5 * observation.m_3var_angle / observation.m_var_angle;
	}

	if (!isnan(obj->pose().z()) && !isnan(observation.pose().z()))
	{
		min_mahal_dist += 0.5 * m_3var_compass / m_var_compass;
	}

	return min_mahal_dist;
}

LandmarkObservation::LandmarkObservation(Type type, const Vec3f &pose)
	: field_model::WorldObject(type, pose.cast<double>()), m_distance(pose.head<2>().norm()), m_angle(atan2(pose.y(), pose.x())), m_confidence(1.0), m_association(0), m_isMahalSet(false)
{
}

LandmarkObservation::~LandmarkObservation()
{
}

////////////////////////////////////////////////////////////////////////////////
// Particle filter

LocalizationPF::LocalizationPF()
	: ParticleFilter<Vec3f, Vec3f, LandmarkObservation, Mat22f>(
		  new UniformParticleInitializer(),
		  new OdometryModel(),
		  new ObservationModel(this),
		  100,//5.14edit
		  300,
		  0.01,
		  0.05),
	  m_field(field_model::FieldModel::getInstance()),
	  m_use_odom("localization/usd_odom", false)
{
	ros::NodeHandle nh("~");
	ROS_WARN("after nh");

	m_lastTime = ros::Time::now();

	m_sub_vision = nh.subscribe(
		"/vision/detections", 1, &LocalizationPF::handleDetections, this);

	m_sub_compass = nh.subscribe(
		"/compass/heading", 1, &LocalizationPF::handleCompass, this);

	m_pub_all_poses = nh.advertise<localization_pkg::ParticleSet>("particles", 1);
	m_pub_pose = nh.advertise<localization_pkg::Particle>("mean_particle", 1);

	m_sub_initPose = nh.subscribe("/initialpose", 1, &LocalizationPF::handleInitPose, this);

	m_odomPose.setZero();
	m_mean.setZero();

	m_minEffectiveSampleSizeRatio = 0.5f; // 0.5f;
	m_uniformReplacementProbability = 0.05f;
	m_actualUniformReplacementProbability = m_uniformReplacementProbability;
	m_usingActualReplacement = false;

	m_odomTimestamp = ros::Time(0);
}

LocalizationPF::~LocalizationPF()
{
}

void LocalizationPF::handleDetections(const localization_pkg::DetectionsConstPtr &msg)
{
	m_vision_detections = msg;
}

void LocalizationPF::handleCompass(const localization_pkg::CompassHeadingConstPtr &compass)
{
	m_compassHeading = compass;
}

bool LocalizationPF::isOutOfField(const ParticleT &particle) const
{
	const double MARGIN = 0.5;
	double hw = m_field->width() / 2.0 + MARGIN;
	double hl = m_field->length() / 2.0 + MARGIN;

	Eigen::Array<float, 2, 1> abspos = particle.getState().head<2>().array().abs();

	return abspos.x() > hl || abspos.y() > hw;
}

void LocalizationPF::step()
{
	// Calculate uniform replacement probability
	const float uniformReplacementTreshold = 0.02f; // scale between 0 and 1 in interval [UniformReplacementTreshold;1]
	float newUniformReplacementProbability = std::min(1.f, std::max(0.f, 1.f - (float)(m_fastAverageLikelihood / m_slowAverageLikelihood) - uniformReplacementTreshold));
	newUniformReplacementProbability *= 1.f / (1.f - uniformReplacementTreshold);

	const float urp_alpha = 0.99;
	m_actualUniformReplacementProbability = urp_alpha * m_actualUniformReplacementProbability + (1.f - urp_alpha) * newUniformReplacementProbability;

	// 	if(gPFmode==1 && (!commBuffer.data[ 0 ].halt_PPCGUI || commBuffer.cmd[0].Command!=CMD_PLAY)){
	// 		m_uniformReplacementProbability = 0.f;
	// 		m_usingActualReplacement = false;
	// 	}else{
	if (!m_usingActualReplacement)
		// reset to a high value when switching to "stop"
		m_uniformReplacementProbability = m_actualUniformReplacementProbability = 0.2f;
	else
	{
		m_uniformReplacementProbability = std::max(0.05f, m_actualUniformReplacementProbability);
	}

	m_usingActualReplacement = true;
	// 	}

	// Calculate displacement for odometry model
	ros::Time now = ros::Time::now();
	tf::Stamped<tf::Pose> ident(
		tf::Transform(tf::createIdentityQuaternion(), tf::Vector3(0, 0, 0)),
		ros::Time(0), "/base_link");
	// tf: odom -> base_link
	tf::Stamped<tf::Pose> odom_pose;

	try
	{
		m_tf.transformPose("/odom", ident, odom_pose);
		m_odomTimestamp = odom_pose.stamp_;
	}
	catch (tf::TransformException &e)
	{
		fprintf(stderr, "Failed to compute odometry pose, using identity\n");
		odom_pose = ident;
	}

	double yaw, pitch, roll;
	odom_pose.getBasis().getEulerYPR(yaw, pitch, roll);

	Vec3f current_odom(
		odom_pose.getOrigin().x(),
		odom_pose.getOrigin().y(),
		yaw);
		// 打印当前姿态
    // std::cout << "Current odometry pose: " 
    //           << "x = " << current_odom.x() 
    //           << ", y = " << current_odom.y() 
    //           << ", yaw = " << yaw 
    //           << " (radians)" << std::endl;
	// [delta_x, delta_y, delta_yaw]
	Vec3f delta;
	delta.head<2>() = current_odom.head<2>() - m_odomPose.head<2>();
	delta.z() = picut(current_odom.z() - m_odomPose.z());

	m_odomPose = current_odom;

	// predict: update particles with odometry model
	sample(delta, (now - m_lastTime).toSec());

	// Constrain to soccer field
	for (size_t i = 0; i < m_currNumParticles; ++i)
	{
		ParticleT *particle = &m_particles[m_currParticleSetIdx][i];

		if (isOutOfField(*particle))
			particle->setWeight(log(0.001));
	}

	std::vector<LandmarkObservation> observations;
	if (m_vision_detections)
	{
		// add landmarks to observations
		for (size_t i = 0; i < m_vision_detections->objects.size(); ++i)
		{
			const localization_pkg::ObjectDetection &obj = m_vision_detections->objects[i];

			// landmarks only observed postion
			Vec3f pose(obj.pose.x, obj.pose.y, NAN);
			ROS_WARN("Invalid type in object detection: %d", obj.type);


			if (obj.type >= field_model::WorldObject::NumTypes)
			{
				ROS_WARN("Invalid type in object detection: %d", obj.type);
				continue;
			}

			// FIXME: Remove me as soon as Julio is doing the filtering
			// if (pose.x() < 0)
			// 	continue;

        	// Define type string based on the object type
			std::string typeStr;
			switch (obj.type) {
				case field_model::WorldObject::Type_Circle:
					typeStr = "中心圆";
					break;
				case field_model::WorldObject::Type_Goal:
					typeStr = "球门（中心位置）";
					break;
				case field_model::WorldObject::Type_GoalPost:
					typeStr = "球门柱";
					break;
				case field_model::WorldObject::Type_XMarker:
					typeStr = "点球标记";
					break;
				case field_model::WorldObject::Type_FieldLine:
					typeStr = "场地线";
					break;
				case field_model::WorldObject::Type_LineXingT:
					typeStr = "T形交叉";
					break;
				case field_model::WorldObject::Type_LineXingX:
					typeStr = "X形交叉";
					break;
				case field_model::WorldObject::Type_LineXingL:
					typeStr = "L形交叉";
					break;
				case field_model::WorldObject::Type_MagneticHeading:
					typeStr = "磁航向";
					break;
				default:
					typeStr = "未知类型";
					break;
        	}

        	fprintf(stderr, "Using %s at % 10.7lf, % 10.7lf\n", typeStr.c_str(), pose.x(), pose.y());
        	LandmarkObservation obs(
				(field_model::WorldObject::Type)obj.type,
				pose);

			observations.push_back(obs);
		}
	}

	if (m_compassHeading && (now - m_compassHeading->stamp) < ros::Duration(2.0))
	{
		// add compassHeading to observations every 2 seconds
		fprintf(stderr, "Using compass value %lf\n", m_compassHeading->heading);
		// compassHeading only observed yaw
		LandmarkObservation obs(
			field_model::WorldObject::Type_MagneticHeading,
			Vec3f(NAN, NAN, m_compassHeading->heading));
		observations.push_back(obs);
	}


	if (observations.size() > 0)
	{

		// resample all particals
		BOOST_FOREACH (LandmarkObservation &ob, observations)
			((ObservationModel *)m_observationModel)->precalculateVariances(ob);

		importance(observations);


		resample();
	}
	publishDebug();
	determinePose();
	publishTransform();

	m_lastTime = now;
}


//obs：观测的信息
//objs:预定义信息
void LocalizationPF::establishDataAssociation(
	ParticleT &particle, std::vector<LandmarkObservation> &observations)
{
	particle.getUserData() = Eigen::Rotation2D<float>(particle.getState().z());

	for (size_t i = 0; i < observations.size(); ++i)//遍历所有观测特征2（T，T）
	{
		LandmarkObservation *obs = &observations[i];

		if (obs->type() == field_model::WorldObject::Type_XMarker || obs->type() == field_model::WorldObject::Type_GoalPost || obs->type() == field_model::WorldObject::Type_LineXingL || obs->type() == field_model::WorldObject::Type_LineXingT || obs->type() == field_model::WorldObject::Type_LineXingX || obs->type() == field_model::WorldObject::Type_MagneticHeading)
		{
			std::vector<DataAssociationPair> matches;

			const std::vector<field_model::WorldObject> &objs = m_field->objects(obs->type());//获取每一个特征点对应场地中所有该类型特征4
		
			double minLikelihood = -1.0;

			for (size_t j = 0; j < objs.size(); ++j)//遍历每一个预定义的场地
			{
				// 打印每个场地特征点的坐标
                // std::cout << "Object " << j << " Type: " << objs[j].type()
                //           << " Position: (" << objs[j].pose().x() << ", "
                //           << objs[j].pose().y() << ", " << objs[j].pose().z() << ")" << std::endl;

				// std::cout<<"objs.size()"<<objs.size()<<std::endl;
				
				/*
				这一行代码的作用是将当前的观测特征（obs）与场地中的某个已知地标（objs[j]）关联起来。
				*/
				obs->setAssociatedObject(&objs[j]);

    			// std::cout << "Likelihood " << j << ": " << std::endl;


				double likelihood = m_observationModel->likelihood(particle, *obs);//计算该粒子与观测信息的似然度
				
				// 打印 likelihood 及其编号
    			// std::cout << "Likelihood " << j << ": " << likelihood << std::endl;

				if (minLikelihood < 0)
					minLikelihood = likelihood;

				matches.push_back(DataAssociationPair(
					likelihood, &objs[j]));
			}

			if (obs->type() == field_model::WorldObject::Type_LineXingL)
			{
				// if landmark is "Type_LineXingL" also match with "Type_LineXingT" type
				const std::vector<field_model::WorldObject> &objs = m_field->objects(field_model::WorldObject::Type_LineXingT);

				for (size_t j = 0; j < objs.size(); ++j)
				{
					obs->setAssociatedObject(&objs[j]);

					double likelihood = m_observationModel->likelihood(particle, *obs);
					if (minLikelihood < 0)
						minLikelihood = likelihood;

					matches.push_back(DataAssociationPair(
						likelihood, &objs[j]));
				}
			}

			if (obs->type() == field_model::WorldObject::Type_LineXingT)
			{
				// if landmark is "Type_LineXingT" also match with "Type_LineXingX" type
				const std::vector<field_model::WorldObject> &objs = m_field->objects(field_model::WorldObject::Type_LineXingX);

				for (size_t j = 0; j < objs.size(); ++j)
				{
					obs->setAssociatedObject(&objs[j]);

					double likelihood = m_observationModel->likelihood(particle, *obs);
					if (minLikelihood < 0)
						minLikelihood = likelihood;

					matches.push_back(DataAssociationPair(
						likelihood, &objs[j]));
				}
			}

			determineMatch(matches, minLikelihood, obs);
		}
	}
}

void LocalizationPF::determineMatch(
	std::vector<DataAssociationPair> &matches, double minLikelihood,
	LandmarkObservation *obs)
{
	double minMahalDist = minLikelihood;
	const field_model::WorldObject *assoc = 0;

	for (size_t i = 0; i < matches.size(); ++i)
	{
		if (matches[i].mahal_dist <= minMahalDist)
		{
			minMahalDist = matches[i].mahal_dist;
			assoc = matches[i].object;
		}
	}

	if (assoc)
	{
		obs->setAssociatedObject(assoc);
		obs->setMahalDist(minMahalDist, minLikelihood);
	}
}

void LocalizationPF::publishDebug()
{
	localization_pkg::ParticleSet msg;

	msg.header.frame_id = "/map";
	msg.header.stamp = timestamp();

	msg.particles.reserve(m_currNumParticles);

	float maxlh = -1e10;
	for (size_t p = 0; p < m_currNumParticles; p++)
	{
		float lh = m_particles[m_currParticleSetIdx][p].getWeight();

		if (lh > maxlh)
			maxlh = lh;
	}
	fprintf(stderr, "lh: % 10.7f (resampled: %d)\n", maxlh, m_hasResampled);

	for (size_t i = 0; i < m_currNumParticles; ++i)
	{
		const ParticleT &particle = m_particles[m_currParticleSetIdx][i];

		localization_pkg::Particle p;
		p.pose.x = particle.getState().x();
		p.pose.y = particle.getState().y();
		p.pose.theta = particle.getState().z();
		p.weight = exp(particle.getWeight() - maxlh);

		msg.particles.push_back(p);
	}

	// fprintf(stderr, "Publishing...\n");
	m_pub_all_poses.publish(msg);
}

void LocalizationPF::meanShift(const Vec2f &startCartPos, float startOri, float maxCartDist2, float maxAngDist, Vec3f &mean, double &weightSumFraction)
{
	Vec2f lastCartMean(startCartPos);
	float lastOriMean(startOri);
	double lastWeightSumFraction = 0;
	const int maxNumIterations = 20;

	for (int i = 0; i < maxNumIterations; ++i)
	{
		Vec2f windowCartMean(0, 0);
		Vec2f windowDirMean(0, 0);
		float windowOriMean = 0;
		double weightSum = 0;
		ParticleSetT &particles = m_particles[m_currParticleSetIdx];
		for (unsigned int p = 0; p < m_currNumParticles; p++)
		{
			const Vec3f &state = particles[p].getState();
			Vec2f cartPos = state.head<2>();
			if (((cartPos - lastCartMean).squaredNorm() <= maxCartDist2) && (fabs(picut(state.z() - lastOriMean)) <= maxAngDist))
			{
				double weight = exp((double)particles[p].getWeight());
				windowCartMean += (float)weight * cartPos;
				windowDirMean += (float)weight * Vec2f(cos(state.z()), sin(state.z()));
				weightSum += weight;
			}
		}
		if (weightSum == 0)
		{
			windowCartMean = lastCartMean;
			windowOriMean = lastOriMean;
		}
		else
		{
			windowCartMean /= (float)weightSum;
			windowOriMean = atan2(windowDirMean.y(), windowDirMean.x());
		}
		if (((windowCartMean - lastCartMean).squaredNorm() < 0.001f) || (fabs(picut(windowOriMean - lastOriMean)) < 0.001f))
		{
			lastCartMean = windowCartMean;
			lastOriMean = windowOriMean;
			lastWeightSumFraction = weightSum;
			break;
		}
		lastCartMean = windowCartMean;
		lastOriMean = windowOriMean;
	}
	mean = Vec3f(lastCartMean.x(), lastCartMean.y(), lastOriMean);
	weightSumFraction = lastWeightSumFraction;
}

void LocalizationPF::determinePose()
{
	// best particle is the particle with "highest weight"
	ParticleT *bestParticle = NULL;
	float maxweight = -1000.f;
	double weightSum = 0;
	ParticleSetT &particles = m_particles[m_currParticleSetIdx];

	for (unsigned int p = 0; p < m_currNumParticles; p++)
	{
		ParticleT &particle = particles[p];
		if ((bestParticle == NULL) || (particle.getWeight() > maxweight))
		{
			maxweight = particle.getWeight();
			bestParticle = &particle;
		}
		weightSum += exp((double)particle.getWeight());
	}
	// m_mean = bestParticle->getState();
	// m_cov.setEye();
	// m_confidence = 1;

	const float windowCartDist2 = 0.5f * 0.5f;
	const float windowAngDist = 0.3f;

	Vec3f lastMean;
	double lastMeanWeightFraction = 0;
	meanShift(m_mean.head<2>(), m_mean.z(), windowCartDist2, windowAngDist, lastMean, lastMeanWeightFraction);
	float lastMeanConfidence = 0;
	if (weightSum != 0)
	{
		lastMeanConfidence = (float)std::max(0.f, std::min(1.f, (float)(lastMeanWeightFraction / weightSum)));
	}

	m_mean = lastMean;
	m_confidence = lastMeanConfidence;

	if (weightSum != 0)
	{
		Vec3f bestParticleMean;
		double bestParticleWeightFraction = 0;
		meanShift(bestParticle->getState().head<2>(), bestParticle->getState().z(), windowCartDist2, windowAngDist, bestParticleMean, bestParticleWeightFraction);
		// bestParticleConfidence in [0.0,1.0]
		float bestParticleConfidence = (float)std::max(0.f, std::min(1.f, (float)(bestParticleWeightFraction / weightSum)));
		if (bestParticleConfidence > 4.5f * lastMeanConfidence)
		{
			m_mean = bestParticleMean;
			m_confidence = bestParticleConfidence;
		}
	}

	// constrain position on field
	m_mean.x() = std::max<float>(-m_field->length() / 2.0, std::min<float>(m_field->length() / 2.0, m_mean.x()));
	m_mean.y() = std::max<float>(-m_field->width() / 2.0, std::min<float>(m_field->width() / 2.0, m_mean.y()));

	localization_pkg::Particle p1;
	p1.pose.x = m_mean.x();
	p1.pose.y = m_mean.y();
	p1.pose.theta = m_mean.z() * (180.0 / M_PI);
	// p1.weight = exp(m_mean.getWeight() - maxlh);

	m_pub_pose.publish(p1);



	std::cout<<"x="<<m_mean.x()<<std::endl;
	std::cout<<"y="<<m_mean.y()<<std::endl;
	std::cout << "theta (degrees)=" << m_mean.z() * (180.0 / M_PI) << std::endl;  // 打印角度朝向（度数）

}

void LocalizationPF::publishTransform()
{
	// map -> odom -> ego_floor -> ego_rot -> trunk_link -> camera_optical
	tf::StampedTransform t;
	t.frame_id_ = "/map";
	t.child_frame_id_ = "/odom";
	t.stamp_ = ros::Time::now() /* (timestamp() + ros::Duration(0.1)) */;
	// t.stamp_ = timestamp() + ros::Duration(0.1);//5.12
	if (m_use_odom())
	{
		// ROS_INFO("m_use_odom success");
		// subtracting base to odom from map to base and send map to odom instead
		tf::Stamped<tf::Pose> odom_to_map;
		try
		{
			tf::Transform tmp_tf(
				tf::createQuaternionFromYaw(m_mean.z()),
				tf::Vector3(m_mean.x(), m_mean.y(), 0.0));
			// tf: base_link -> map(at landmarks' timestamp)
			tf::Stamped<tf::Pose> tmp_tf_stamped(
				tmp_tf.inverse(),
				timestamp(),
				"/base_link");
			// m_tf.waitForTransform("/odom", "/odom", tmp_tf_stamped.stamp_, ros::Duration(0.5));//5.12
			// transform base-> map (at landmarks' timestamp) to odom frame (at now)
			// which is odom -> map (at now)
			m_tf.transformPose("/odom", tmp_tf_stamped, odom_to_map);
		}
		catch (tf::TransformException &e)
		{
			fprintf(stderr, "Failed to subtract base to odom transform: %s\n", e.what());
			return;
		}

		tf::Transform inv = odom_to_map.inverse();

		t.setOrigin(inv.getOrigin());
		t.setRotation(inv.getRotation());
	}
	else
	{
		ROS_INFO("m_use_odom fail");
		// tf: map -> base_link (at landmarks' timestamp)
		tf::Transform tmp_tf(
			tf::createQuaternionFromYaw(m_mean.z()),
			tf::Vector3(m_mean.x(), m_mean.y(), 0.0));
		t.setOrigin(tmp_tf.getOrigin());
		t.setRotation(tmp_tf.getRotation());
		t.child_frame_id_ = "/base_link";
	}
	m_pub_tf.sendTransform(t);
}

void LocalizationPF::handleInitPose(const geometry_msgs::PoseWithCovarianceStamped &pose)
{
	PoseParticleInitializer poseParticleInitializer(
		Vec3f(pose.pose.pose.position.x, pose.pose.pose.position.y, tf::getYaw(pose.pose.pose.orientation)),
		Vec3f(0.2, 0.2, 10.0 * M_PI / 180.0));

	for (unsigned int i = 0; i < 2; ++i)
	{
		for (unsigned int p = 0; p < m_particles[i].size(); p++)
		{
			poseParticleInitializer.initParticle(m_particles[i][p]);
		}
	}
}

void LocalizationPF::drawParticles(cv::Mat &image, double scaleX, double scaleY, const cv::Point2d &center)
{
    // 绘制所有粒子
    for (size_t i = 0; i < m_currNumParticles; ++i)
    {
        const ParticleT &particle = m_particles[m_currParticleSetIdx][i];
        cv::Point2d pos(center.x + particle.getState().x() * scaleX, center.y - particle.getState().y() * scaleY);
        cv::circle(image, pos, 2, cv::Scalar(0, 0, 255), -1); // 红色小圆点表示普通粒子
    }

    // 绘制估计位置
    cv::Point2d estimatedPos(center.x + m_mean.x() * scaleX, center.y - m_mean.y() * scaleY);
    cv::circle(image, estimatedPos, 5, cv::Scalar(0, 255, 0), -1); // 绿色大圆点表示估计位置

    // 显示估计位置的坐标，并保留小数点后一位
    std::stringstream ss;
    ss << std::fixed << std::setprecision(1);
    ss << "(" << m_mean.x() << ", " << m_mean.y() << ")";
    std::string text = ss.str();

    int fontFace = cv::FONT_HERSHEY_SIMPLEX;
    double fontScale = 0.5;
    int thickness = 1;
    cv::Point textPos(estimatedPos.x + 10, estimatedPos.y - 10); // 文本位置相对于估计位置的偏移

    cv::putText(image, text, textPos, fontFace, fontScale, cv::Scalar(0, 0, 0), thickness, 8); // 黑色文本
}