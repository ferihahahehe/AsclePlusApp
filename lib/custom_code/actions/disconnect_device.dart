// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'index.dart'; // Pastikan ini mengimpor manageDataListener

Future disconnectDevice(BTDeviceStruct deviceInfo) async {
  final device = BluetoothDevice.fromId(deviceInfo.id);
  try {
    await manageConnectionStateListener('stop', deviceInfo);
    await manageDataListener('stop', deviceInfo);
    await device.disconnect();
    FFAppState().isDeviceConnected = false;
    FFAppState().receivedData = '-';
  } catch (e) {
    debugPrint(e.toString());
  }
}
