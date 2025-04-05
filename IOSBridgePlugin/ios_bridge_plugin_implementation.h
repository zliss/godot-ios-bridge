///
// © 2025-present https://github.com/zliss
//

#ifndef deeplink_plugin_implementation_h
#define deeplink_plugin_implementation_h

#include "core/object/object.h"
#include "core/object/class_db.h"


extern String const DEEPLINK_RECEIVED_SIGNAL;


class IOSBridgePlugin : public Object {
	GDCLASS(IOSBridgePlugin, Object);

private:
	static IOSBridgePlugin* instance;

	bool initialized;

	static void _bind_methods();
	
public:

	String send_message(String p_param);

	static IOSBridgePlugin* get_singleton();
	
	IOSBridgePlugin();
	~IOSBridgePlugin();
};

#endif /* deeplink_plugin_implementation_h */
