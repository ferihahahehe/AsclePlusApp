// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Di dalam file lib/custom_code/actions/connect_device.dart

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'index.dart'; // Pastikan ini mengimpor semua custom action lain

Future<bool> connectDevice(BTDeviceStruct deviceInfo) async {
  final device = BluetoothDevice.fromId(deviceInfo.id);
  try {
    await device.connect(mtu: null);
    FFAppState().isDeviceConnected = true;
    return true;
  } catch (e) {
    debugPrint('Connection failed: ${e.toString()}');
    FFAppState().isDeviceConnected = false;
    return false;
  }
}
