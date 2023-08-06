import 'package:ble_peripheral_windows/ble_peripheral_windows.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BlePeripheralWindows blePeripheralWindows = BlePeripheralWindows();

  @override
  void initState() {
    blePeripheralWindows.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Python Channel Example'),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Is Advertising: "),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    blePeripheralWindows.addServices();
                  },
                  child: const Text("Add Services")),
              ElevatedButton(
                  onPressed: () {
                    blePeripheralWindows.startAdvertising();
                  },
                  child: const Text("Start Advertising")),
              ElevatedButton(
                  onPressed: () {
                    blePeripheralWindows.stopAdvertising();
                  },
                  child: const Text("Stop Advertising")),
            ],
          )
        ],
      ),
    );
  }
}
