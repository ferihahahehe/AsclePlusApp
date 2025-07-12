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
import 'dart:async';

Future<bool> isBluetoothEnabled() async {
  if (await FlutterBluePlus.isSupported == false) {
    print("Bluetooth not supported by this device");
    return false;
  }

  // Langsung periksa status saat ini
  return await FlutterBluePlus.isOn;
}
