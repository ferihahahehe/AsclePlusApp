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
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';

// Kelas statis untuk menyimpan subscription dari listener koneksi.
class ConnectionStateListenerManager {
  static StreamSubscription? _subscription;
}

Future<void> manageConnectionStateListener(
    String action, BTDeviceStruct deviceInfo) async {
  // Jangan lakukan apa-apa jika ID perangkat kosong.
  if (deviceInfo.id.isEmpty) {
    return;
  }
  final device = BluetoothDevice.fromId(deviceInfo.id);

  if (action == 'start') {
    // Batalkan listener sebelumnya untuk menghindari duplikat.
    await ConnectionStateListenerManager._subscription?.cancel();

    // KODE DIPERBAIKI: Gunakan stream `connectionState` dan tipe `BluetoothConnectionState`.
    ConnectionStateListenerManager._subscription =
        device.connectionState.listen((BluetoothConnectionState state) {
      print('Device ${device.remoteId} connection state changed to $state');

      // KODE DIPERBAIKI: Gunakan enum `BluetoothConnectionState`.
      if (state == BluetoothConnectionState.disconnected) {
        FFAppState().isDeviceConnected = false;
        // Reset juga perangkat saat ini di App State untuk konsistensi.
        FFAppState().currentDevice = BTDeviceStruct.fromSerializableMap(
            jsonDecode('{"name":"No Device Connected","id":""}'));

        // Hentikan listener ini karena perangkat sudah tidak terkoneksi.
        ConnectionStateListenerManager._subscription?.cancel();
      } else if (state == BluetoothConnectionState.connected) {
        FFAppState().isDeviceConnected = true;
      }
    });
  } else if (action == 'stop') {
    // Hentikan listener secara manual saat pengguna sengaja disconnect.
    await ConnectionStateListenerManager._subscription?.cancel();
    ConnectionStateListenerManager._subscription = null;
  }
}
