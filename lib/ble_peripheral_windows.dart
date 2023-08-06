import 'package:python_channel/python_channel.dart';

class BlePeripheralWindows {
  MethodChannel? methodChannel;
  JsonChannel? jsonChannel;

  void initialize() async {
    methodChannel = MethodChannel(name: 'methodChannel');
    jsonChannel = JsonChannel(name: "jsonChannel");
    jsonChannel?.setHandler(_channelHandler);
    methodChannel?.setHandler(_channelHandler);

    PythonChannelPlugin.bindHost(
      name: 'host',
      debugPyPath: '..\\python\\main.py',
      releasePath: "",
    );
    PythonChannelPlugin.bindChannel('host', methodChannel!);
    PythonChannelPlugin.bindChannel('host', jsonChannel!);
  }

  // Future<File> getFilePath() async {
  // String path = "packages/simpleble_flutter/assets/BLEServer.exe";
  //   final byteData = await fs.rootBundle.load(path);
  //   final buffer = byteData.buffer;
  //   Directory tempDir = await getTemporaryDirectory();
  //   String tempPath = tempDir.path;
  //   var filePath = '$tempPath/belServer.exe';
  //   return File(filePath).writeAsBytes(
  //       buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  // }

  void _channelHandler(message, reply) {
    if (message["type"] == null) return;
    String type = message["type"];
    var data = message["data"];
    switch (type) {
      case "event":
        _printLog("Event: $data");
        break;
      case "scanResult":
        _printLog("scanResult: $data");
        break;
      case "onDisconnected":
        _printLog("onDisconnected: $message");
        break;
      case "onConnected":
        _printLog("onConnected: $message");
        break;
      default:
        _printLog(message.toString());
    }
  }

  void startAdvertising() async {
    try {
      await methodChannel?.invokeMethod("startAdvertising", {"": ""});
    } catch (e) {
      _printLog(e.toString());
    }
  }

  void stopAdvertising() async {
    try {
      await methodChannel?.invokeMethod("stopAdvertising", {"": ""});
    } catch (e) {
      _printLog(e.toString());
    }
  }

  void addServices() async {
    try {
      await methodChannel?.invokeMethod("addServices", {"": ""});
    } catch (e) {
      _printLog(e.toString());
    }
  }

  void _printLog(log) {
    // ignore: avoid_print
    print(log);
  }
}
