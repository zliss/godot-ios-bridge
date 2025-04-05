//
// © 2025-present https://github.com/zliss
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ios_bridge_plugin_implementation.h"


String const BRIDGE_RECEIVED_SIGNAL = "call_received";

IOSBridgePlugin* IOSBridgePlugin::instance = NULL;


void IOSBridgePlugin::_bind_methods() {
	ClassDB::bind_method(D_METHOD("send_message"), &IOSBridgePlugin::send_message);

	ADD_SIGNAL(MethodInfo(BRIDGE_RECEIVED_SIGNAL, PropertyInfo(Variant::STRING, "msg")));
}

String IOSBridgePlugin::send_message(String p_param) {
	// NSLog(@" sendMessage : %@", p_param);
	NSString *msg1 = [[NSString alloc] initWithUTF8String:p_param.utf8().get_data()];
	NSLog(@" sendMessage msg1 : %@", msg1);
	emit_signal(BRIDGE_RECEIVED_SIGNAL, [[NSString stringWithFormat:@"[ObjC signal]: %@", msg1] UTF8String]);
	return [[NSString stringWithFormat:@"[ObjC Received]: %@", msg1] UTF8String];
}

IOSBridgePlugin* IOSBridgePlugin::get_singleton() {
	return instance;
}

IOSBridgePlugin::IOSBridgePlugin() {
	NSLog(@"IOSBridgePlugin constructor");

	ERR_FAIL_COND(instance != NULL);
	instance = this;

	initialized = false;
}

IOSBridgePlugin::~IOSBridgePlugin() {
	NSLog(@"IOSBridgePlugin destructor");

	if (instance == this) {
		instance = NULL;
	}
}
