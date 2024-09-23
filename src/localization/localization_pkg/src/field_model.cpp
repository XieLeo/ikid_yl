// Model for the soccer field
#include "localization_pkg/field_model.h"
#include <ros/node_handle.h>
#include <boost/concept_check.hpp>
#include <opencv2/opencv.hpp>


namespace field_model
{

	FieldModel *FieldModel::m_instance = 0;

	inline double picut(double a)
	{
		while (a > M_PI)
			a -= 2.0 * M_PI;
		while (a < -M_PI)
			a += 2.0 * M_PI;

		return a;
	}

	WorldObject::WorldObject(WorldObject::Type type, const Eigen::Vector3d &pose)
		: m_type(type), m_pos(pose)
	{
	}

	WorldObject::WorldObject(WorldObject::Type type, double x, double y, double t)
		: m_type(type)
	{
		m_pos << x, y, t;
	}

	WorldObject::WorldObject(WorldObject::Type type, const std::vector<Eigen::Vector2d> &points)
		: m_type(type), m_pos(0.0, 0.0, 0.0), m_points(points)
	{
	}

	void WorldObject::setPose(const Eigen::Vector3d &pose)
	{
		m_pos = pose;
	}

	WorldObject WorldObject::mirrorX() const
	{
		WorldObject ret;

		ret.m_type = m_type;
		ret.m_pos << -m_pos.x(), m_pos.y(), picut(M_PI - m_pos.z());

		for (size_t i = 0; i < m_points.size(); ++i)
		{
			ret.m_points.push_back(Eigen::Vector2d(-m_points[i].x(), m_points[i].y()));
		}

		return ret;
	}

	WorldObject WorldObject::mirrorY() const
	{
		WorldObject ret;

		ret.m_type = m_type;
		ret.m_pos << m_pos.x(), -m_pos.y(), -m_pos.z();

		for (size_t i = 0; i < m_points.size(); ++i)
		{
			ret.m_points.push_back(Eigen::Vector2d(m_points[i].x(), -m_points[i].y()));
		}

		return ret;
	}

	FieldModel::FieldModel()
		: m_param_magneticHeading("/field/magneticHeading", -M_PI, 0.001, M_PI, 0.0)
	{
		// kidsize
		m_length = 9.0;
		m_width = 6.0;
		m_goalWidth = 2.6;
		m_centerCircleDiameter = 1.5;
		m_goalAreaWidth = 3.0;
		m_goalAreaDepth = 1.0;
		m_penaltyMarkerDist = 1.5;

		double hw = m_width / 2.0;
		double hl = m_length / 2.0;
		std::vector<Eigen::Vector2d> points;

		// Goals & posts
		addObject(WorldObject::Type_Goal, -hl, 0.0, 0.0, MirrorX);
		addObject(WorldObject::Type_GoalPost, -hl, m_goalWidth / 2.0, 0.0, MirrorAll);

		// Center circle
		addObject(WorldObject::Type_Circle, 0.0, 0.0, 0.0, NoMirror);

		// Penalty markers
		addObject(WorldObject::Type_XMarker, -hl + m_penaltyMarkerDist, 0.0, 0.0, MirrorX);

		// Center line
		points.clear();
		points.push_back(Eigen::Vector2d(0.0, hw));
		points.push_back(Eigen::Vector2d(0.0, -hw));
		addLine(points, NoMirror);

		// Side lines
		points.clear();
		points.push_back(Eigen::Vector2d(-hl, hw));
		points.push_back(Eigen::Vector2d(hl, hw));
		addLine(points, MirrorY);

		// Goal lines
		points.clear();
		points.push_back(Eigen::Vector2d(-hl, hw));
		points.push_back(Eigen::Vector2d(-hl, -hw));
		addLine(points, MirrorX);

		// Goal area lines (long line)
		points.clear();
		points.push_back(Eigen::Vector2d(-hl + m_goalAreaDepth, m_goalAreaWidth / 2.0));
		points.push_back(Eigen::Vector2d(-hl + m_goalAreaDepth, -m_goalAreaWidth / 2.0));
		addLine(points, MirrorX);

		// Goal area lines (small line)
		points.clear();
		points.push_back(Eigen::Vector2d(-hl, m_goalAreaWidth / 2.0));
		points.push_back(Eigen::Vector2d(-hl + m_goalAreaDepth, m_goalAreaWidth / 2.0));
		addLine(points, MirrorAll);

		// Penalty area lines (long line)
		points.clear();
		points.push_back(Eigen::Vector2d(-(hl-2), 2.5));
		points.push_back(Eigen::Vector2d(-(hl-2), -2.5));
		addLine(points, MirrorX);

		// Penalty area lines (small line)
		points.clear();
		points.push_back(Eigen::Vector2d(-hl, 2.5));
		points.push_back(Eigen::Vector2d(-(hl-2), 2.5));
		addLine(points, MirrorAll);
		

		//L1
		// Corner L Xings (theta is the half angle between the two lines)
		addObject(WorldObject::Type_LineXingL, -hl, hw, -M_PI / 4.0, MirrorAll);

		//L2
		// Penalty area L Xings 
		addObject(WorldObject::Type_LineXingL, -(hl-2), 2.5, -3.0 * M_PI / 4.0, MirrorAll);

		//L3
		// Goal area L Xings 
		addObject(WorldObject::Type_LineXingL, -hl + m_goalAreaDepth, m_goalAreaWidth / 2.0, -3.0 * M_PI / 4.0, MirrorAll);


		//T
		//Penalty Corner T Xings
		addObject(WorldObject::Type_LineXingT, -hl, 2.5, 0.0, MirrorAll);

		// Goal area T Xings (theta points along the central line)
		addObject(WorldObject::Type_LineXingT, -hl, m_goalAreaWidth / 2.0, 0.0, MirrorAll);

		//Center T
		addObject(WorldObject::Type_LineXingT, 0.0, -hw, MirrorY);//jiaodu bug

		// Central X Xings
		addObject(WorldObject::Type_LineXingX, 0.0, m_centerCircleDiameter / 2.0, 0.0, MirrorY);

		// Magnetic orientation
		m_magneticHeading = addObject(WorldObject::Type_MagneticHeading, NAN, NAN, 0.0, NoMirror);

		m_param_magneticHeading.setCallback(
			boost::bind(&FieldModel::updateMagneticHeading, this, _1));
		updateMagneticHeading(m_param_magneticHeading());
	}

	WorldObject *FieldModel::addObject(WorldObject::Type type, double x, double y, double t, int flags)
	{
		std::vector<WorldObject> *list = &m_objects[type];

		WorldObject obj(type, x, y, t);
		list->push_back(obj);

		WorldObject *ret = &list->back();

		if (flags & MirrorX)
			list->push_back(obj.mirrorX());

		if (flags & MirrorY)
			list->push_back(obj.mirrorY());

		if ((flags & MirrorX) && (flags & MirrorY))
			list->push_back(obj.mirrorX().mirrorY());

		return ret;
	}

	void FieldModel::addLine(const std::vector<Eigen::Vector2d> &points, int flags)
	{
		std::vector<WorldObject> *list = &m_objects[WorldObject::Type_FieldLine];

		WorldObject obj(WorldObject::Type_FieldLine, points);
		list->push_back(obj);

		if (flags & MirrorX)
			list->push_back(obj.mirrorX());

		if (flags & MirrorY)
			list->push_back(obj.mirrorY());

		if ((flags & MirrorX) && (flags & MirrorY))
			list->push_back(obj.mirrorX().mirrorY());
	}

	void FieldModel::updateMagneticHeading(float heading)
	{
		m_magneticHeading->setPose(Eigen::Vector3d(NAN, NAN, heading));
	}

	void FieldModel::setMagneticHeading(double heading)
	{
		m_param_magneticHeading.set(heading);
	}

	double FieldModel::magneticHeading() const
	{
		return m_param_magneticHeading();
	}

	FieldModel *FieldModel::getInstance()
	{
		if (!m_instance)
			m_instance = new FieldModel;

		return m_instance;
	}

	    cv::Point2i FieldModel::worldToImage(const Eigen::Vector2d &worldPoint, double imgWidth, double imgHeight)
    {
        double scaleX = imgWidth / (m_length+2);
        double scaleY = imgHeight / (m_width+2);
        int x = static_cast<int>((worldPoint.x() + m_length / 2) * scaleX);
        int y = static_cast<int>((worldPoint.y() + m_width / 2) * scaleY);
        return cv::Point2i(x, y);
    }



}