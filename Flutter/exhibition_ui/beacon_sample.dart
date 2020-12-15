


// turn on bluetooth and location
// allow app location in settings
// change android/app/build.gradle
//        minSdkVersion 19
//
// add to pubspec.yaml
//       flutter_ble_lib:
//
// troubleshooting: turn on/off bluetooth on phone/tablet
// use nordic nrfconnect to find out
//     1) device name
//     2) service
//     3) characteristic

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {

  final BleManager ble = BleManager();
  Peripheral peri;
  final List writeValue = [0x41,0x42,0x43,0x30,0x31,0x32]; // ABC123

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', home: Home()
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State {

  BleManager ble;
  Peripheral peri;
  List writeValue = [0x41,0x42,0x43,0x30,0x31,0x32]; // ABC123

  connectToBle() {
    ble.startPeripheralScan(
    ).listen((scanResult) async {
      if (scanResult.peripheral.name == "Adafruit Bluefruit LE") { // device name
        peri = scanResult.peripheral;
        ble.stopPeripheralScan();
        bool c = await peri.isConnected();
        if (!c) { 
          await peri.connect(); await peri.isConnected();
        }  //test if connected otherwise getting error connected already
        await peri.discoverAllServicesAndCharacteristics();
        peri.writeCharacteristic(
          "6e400001-b5a3-f393-e0a9-e50e24dcca9e", // service
          "6e400002-b5a3-f393-e0a9-e50e24dcca9e", // tx characteristic
          Uint8List.fromList(writeValue),
          false
        );
      }
    });
  }

  @override  
  void initState() {
    super.initState();
    ble = BleManager();
    ble.createClient();
    connectToBle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Text('hello')),
    );
    
  }
}

  


    