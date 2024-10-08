#ifndef CONFIGSERVER_PARAMETERCLIENT_H
#define CONFIGSERVER_PARAMETERCLIENT_H

#include <config_server/SetParameter.h>
#include <config_server/ParameterDescription.h>
#include <config_server/SubscribeList.h>

#include <map>
#include <string>

#include <ros/service_server.h>
#include <ros/timer.h>

#include <boost/thread/recursive_mutex.hpp>

namespace config_server
{

	class ParameterBase;

	class ParameterClient
	{
	public:
		static ParameterClient *instance();

		void registerParameter(ParameterBase *param, const ParameterDescription &desc);
		void unregisterParameter(ParameterBase *param);

		void notify(ParameterBase *param, const std::string &value);

		void cork();
		void uncork();

		void sync();

	private:
		ParameterClient();
		~ParameterClient();

		bool handleSet(SetParameterRequest &req, SetParameterResponse &resp);

		static ParameterClient *g_instance;

		typedef std::multimap<std::string, ParameterBase *> ParameterMap;
		ParameterMap m_parameters;

		ros::ServiceServer m_srv;
		std::string m_srv_name;

		int m_corked;
		config_server::SubscribeList m_subscribe;

		boost::recursive_mutex m_mutex;
	};

}

#endif
