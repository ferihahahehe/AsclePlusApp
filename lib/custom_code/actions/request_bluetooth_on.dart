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

Future<bool> requestBluetoothOn() async {
  try {
    if (isAndroid) {
      // Minta Android untuk menyalakan Bluetooth
      await FlutterBluePlus.turnOn(timeout: 60);
      // Tunggu hingga status adapter benar-benar ON
      await FlutterBluePlus.adapterState
          .where((s) => s == BluetoothAdapterState.on)
          .first;
    }
    // Cek apakah Bluetooth sudah menyala
    return await FlutterBluePlus.isOn;
  } catch (e) {
    debugPrint('Failed to turn on Bluetooth: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
