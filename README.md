# IOSBridge Plugin

Bridge Godot Engine games to iOS native features

A lightweight toolkit enabling Godot projects to access iOS native functionalities.


## Quick Start

### Prerequisites
- Godot 4.3
- Xcode 15.2
- iOS Deployment Target 17.2

### Build
```sh
git clone git@github.com:zliss/godot-ios-bridge.git
cd godot-ios-bridge
git clone https://github.com/godotengine/godot
cd godot
git checkout 4.3-stable
scons platform=ios target=template_release arch=arm64 ios_simulator=no
scons platform=ios target=template_release arch=arm64 ios_simulator=yes
scons platform=ios target=template_debug arch=arm64 ios_simulator=no
scons platform=ios target=template_debug arch=arm64 ios_simulator=yes
cd ..
scons platform=ios target=release_debug arch=arm64 ios_simulator=yes target_name=IOSBridgePlugin version=4.3
```

### Usage
```
func _ready() -> void:
	var _plugin_singleton
	if Engine.has_singleton("IOSBridgePlugin"):
		_plugin_singleton = Engine.get_singleton("IOSBridgePlugin")
		_plugin_singleton.connect("call_received", _call_received)
		var m = _plugin_singleton.send_message("test 123")
		print("IOSBridgePlugin send_message ", m)
	else:
		printerr("%s singleton not found!" % "IOSBridgePlugin")

func _call_received(msg):
	print("IOSBridgePlugin _call_received", msg)
```

```
sendMessage msg1 : test 123
IOSBridgePlugin _call_received[ObjC signal]: test 123
IOSBridgePlugin send_message [ObjC Received]: test 123
```
