//
// © 2025-present https://github.com/zliss
//

#import <Foundation/Foundation.h>

#import "ios_bridge_plugin.h"
#import "ios_bridge_plugin_implementation.h"

#import "core/config/engine.h"


IOSBridgePlugin *plugin;

void ios_bridge_plugin_init() {
	NSLog(@"init plugin");

	plugin = memnew(IOSBridgePlugin);
	Engine::get_singleton()->add_singleton(Engine::Singleton("IOSBridgePlugin", plugin));
}

void ios_bridge_plugin_deinit() {
	NSLog(@"deinit plugin");
	
	if (plugin) {
	   memdelete(plugin);
   }
}
