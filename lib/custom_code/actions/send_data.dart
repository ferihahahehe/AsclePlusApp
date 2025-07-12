// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// Definisikan UUID Service dan Characteristic di sini
final Guid ASCLE_SERVICE_UUID = Guid("19B10000-E8F2-537E-4F6C-D104768A1214");
final Guid TELEMETRY_CHAR_UUID = Guid("19B10001-E8F2-537E-4F6C-D104768A1214");

Future<bool> sendData(BTDeviceStruct deviceInfo, String data) async {
  try {
    final device = BluetoothDevice.fromId(deviceInfo.id);
    final services = await device.discoverServices();

    final ascleService = services.firstWhere(
      (s) => s.uuid == ASCLE_SERVICE_UUID,
      orElse: () => throw Exception('Ascle+ Service not found'),
    );

    final telemetryChar = ascleService.characteristics.firstWhere(
      (c) => c.uuid == TELEMETRY_CHAR_UUID,
      orElse: () => throw Exception('Telemetry Characteristic not found'),
    );

    if (telemetryChar.properties.writeWithoutResponse) {
      await telemetryChar.write(data.codeUnits, withoutResponse: true);
      debugPrint('Data sent successfully: $data');
      return true;
    } else {
      debugPrint('Characteristic is not writable without response.');
      return false;
    }
  } catch (e) {
    debugPrint('Error sending data: ${e.toString()}');
    return false;
  }
}
