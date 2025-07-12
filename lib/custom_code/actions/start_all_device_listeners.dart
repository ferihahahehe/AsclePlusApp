// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<void> startAllDeviceListeners() async {
  final BTDeviceStruct currentDevice = FFAppState().currentDevice;
  final bool isDeviceConnected = FFAppState().isDeviceConnected;

  // Pastikan hanya berjalan jika perangkat terhubung
  if (isDeviceConnected && currentDevice.hasId()) {
    print('Starting all listeners for device: ${currentDevice.id}');
    await manageConnectionStateListener('start', currentDevice);
    await manageDataListener('start', currentDevice);
    await startGlobalDataProcessor();
  } else {
    print(
        'Action startAllDeviceListeners was called, but no device is connected.');
  }
}
