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

import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

final Guid ASCLE_SERVICE_UUID = Guid("19B10000-E8F2-537E-4F6C-D104768A1214");
final Guid TELEMETRY_CHAR_UUID = Guid("19B10001-E8F2-537E-4F6C-D104768A1214");

// Static class to hold the subscription to avoid duplicates.
class BLESingleton {
  static StreamSubscription? _dataSubscription;
}

Future<void> manageDataListener(String action, BTDeviceStruct device) async {
  final bluetoothDevice = BluetoothDevice.fromId(device.id);

  if (action == 'start') {
    // Cancel any old listener to avoid duplicates.
    await BLESingleton._dataSubscription?.cancel();
    BLESingleton._dataSubscription = null;

    try {
      // Wait a moment to ensure service discovery is complete.
      await Future.delayed(const Duration(milliseconds: 750));

      final services = await bluetoothDevice.discoverServices();

      // 1. Find the specific service.
      final ascleService = services.firstWhere(
        (s) => s.uuid == ASCLE_SERVICE_UUID,
        orElse: () => throw Exception('Ascle+ Service not found for listener'),
      );

      // 2. Find the specific characteristic within that service.
      final telemetryChar = ascleService.characteristics.firstWhere(
        (c) => c.uuid == TELEMETRY_CHAR_UUID,
        orElse: () =>
            throw Exception('Telemetry Characteristic not found for listener'),
      );

      // 3. Ensure the characteristic supports notifications.
      if (telemetryChar.properties.notify) {
        // Enable notifications from this characteristic.
        await telemetryChar.setNotifyValue(true);
        debugPrint('Successfully set notify value on ${telemetryChar.uuid}');

        // Start listening for incoming data.
        BLESingleton._dataSubscription =
            telemetryChar.onValueReceived.listen((value) {
          if (value.isEmpty) return;

          final receivedString = String.fromCharCodes(value);
          debugPrint('Data Received: $receivedString');

          // Always update AppState to be reflected in the UI.
          FFAppState().receivedData = receivedString;

          // Check if the received data is a response from a command.
          // Note: The '.contains' checks still use Indonesian keywords as they match the firmware's response.
          if (receivedString.toLowerCase().contains('calibrated') ||
              receivedString.toLowerCase().contains('reset') ||
              receivedString.toLowerCase().contains('battery') ||
              receivedString.toLowerCase().contains('unknown command')) {
            // Show a notification in the app.
            final context = appNavigatorKey.currentContext;
            if (context != null) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Message from Device: $receivedString'),
                  duration: Duration(seconds: 4),
                ),
              );
            }
          }
          // If this is regular telemetry data, process as usual.
          else if (receivedString.contains(';')) {
            processAndAggregateDataBatch(receivedString);
          }
        });

        debugPrint('Listener started successfully for device ${device.id}');
      } else {
        debugPrint(
            'Error: Characteristic ${telemetryChar.uuid} does not support notifications.');
      }
    } catch (e) {
      debugPrint('Error starting data listener: $e');
    }
  } else if (action == 'stop') {
    // Stop the listener.
    await BLESingleton._dataSubscription?.cancel();
    BLESingleton._dataSubscription = null;
    debugPrint('Listener stopped for device ${device.id}');
  }
}
