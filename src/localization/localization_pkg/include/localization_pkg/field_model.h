#pragma once
#include <vector>

#include <Eigen/Core>
#include <opencv2/opencv.hpp>

#include "config_server/parameter.h"

namespace field_model
{

	/**
	 * Objects occuring in our soccer world.
	 **/
	class WorldObject
	{
	public:
		//! Object type
		enum Type
		{
			Type_Circle,		  //!< Center circle 1
			Type_Goal,			  //!< Goal (center position) 2
			Type_GoalPost,		  //!< A single goal post 3
			Type_XMarker,		  //!< One of the two penalty markers 4
			Type_FieldLine,		  //!< Field line 5
			Type_LineXingT,		  //!< T-crossing of two lines 6
			Type_LineXingX,		  //!< X-crossing of two lines 7
			Type_LineXingL,		  //!< L-crossing of two lines 8
			Type_MagneticHeading, //!< Magnetic heading towards X+
			NumTypes
		};

		WorldObject(Type type, const Eigen::Vector3d &pose);
		WorldObject(Type type, double x, double y, double t = 0.0);
		WorldObject(Type type, const std::vector<Eigen::Vector2d> &points);

		WorldObject mirrorX() const;
		WorldObject mirrorY() const;

		//! Object pose (x, y, theta)
		inline Eigen::Vector3d pose() const
		{
			return m_pos;
		}

		//! Points belonging to the object (e.g. line start and end)
		inline const std::vector<Eigen::Vector2d> &points() const
		{
			return m_points;
		}

		//! Object type
		inline Type type() const
		{
			return m_type;
		}

	protected:
		void setPose(const Eigen::Vector3d &pose);

	private:
		friend class FieldModel;

		WorldObject() {}

		Type m_type;
		Eigen::Vector3d m_pos;
		std::vector<Eigen::Vector2d> m_points;
	};

	class FieldModel
	{
	public:
		static FieldModel *getInstance();
		void displayField(const std::string &imagePath);


		//! Field width (inside the lines)
		inline double width() const
		{
			return m_width;
		}

		//! Field length (inside the lines)
		inline double length() const
		{
			return m_length;
		}

		//! Goal width
		inline double goalWidth() const
		{
			return m_goalWidth;
		}

		//! Width of the penalty area before each goal
		inline double goalAreaWidth() const
		{
			return m_goalAreaWidth;
		}

		//! Depth of the penalty area before each goal
		inline double goalAreaDepth() const
		{
			return m_goalAreaDepth;
		}

		inline double centerCircleDiameter() const
		{
			return m_centerCircleDiameter;
		}

		//! Distance from the goal line to the penalty marker
		inline double penaltyMarkerDist() const
		{
			return m_penaltyMarkerDist;
		}

		//! Objects for a specific WorldObject::Type
		inline const std::vector<WorldObject> &objects(WorldObject::Type type) const
		{
			return m_objects[type];
		}

		void setMagneticHeading(double heading);
		double magneticHeading() const;


	private:
		FieldModel();
		cv::Point2i worldToImage(const Eigen::Vector2d &worldPoint, double imgWidth, double imgHeight);


		enum MirrorFlag
		{
			NoMirror = 0,
			MirrorX = (1 << 0),
			MirrorY = (1 << 1),
			MirrorAll = MirrorX | MirrorY
		};
		WorldObject *addObject(WorldObject::Type type, double x, double y, double t, int flags = MirrorX | MirrorY);
		void addLine(const std::vector<Eigen::Vector2d> &points, int flags = MirrorX | MirrorY);

		void updateMagneticHeading(float heading);

		static FieldModel *m_instance;

		double m_width;
		double m_length;
		double m_goalWidth;
		double m_goalAreaWidth;
		double m_goalAreaDepth;
		double m_centerCircleDiameter;
		double m_penaltyMarkerDist;

		std::vector<WorldObject> m_objects[WorldObject::NumTypes];
		WorldObject *m_magneticHeading;

		config_server::Parameter<float> m_param_magneticHeading;
	};

}
