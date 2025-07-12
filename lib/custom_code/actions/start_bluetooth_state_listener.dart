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
import '/flutter_flow/flutter_flow_util.dart'; // Diperlukan untuk FFAppState

// Kelas statis untuk mengelola subscription agar listener hanya dibuat sekali.
class BluetoothListenerManager {
  static StreamSubscription? _subscription;
  static bool isListening = false;
}

Future<void> startBluetoothStateListener() async {
  // Jika listener sudah aktif, jangan lakukan apa-apa.
  if (BluetoothListenerManager.isListening) {
    return;
  }

  // Pastikan perangkat mendukung Bluetooth.
  if (await FlutterBluePlus.isSupported == false) {
    print("Bluetooth not supported by this device");
    return;
  }

  // Tandai bahwa listener sudah akan aktif agar aksi ini tidak dijalankan lagi.
  BluetoothListenerManager.isListening = true;

  // Buat listener untuk memantau status adapter Bluetooth.
  BluetoothListenerManager._subscription =
      FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
    print("Bluetooth adapter state changed to: $state");

    // Perbarui App State global berdasarkan status terbaru.
    // Ini akan secara otomatis memicu UI untuk rebuild di halaman manapun
    // yang menggunakan FFAppState().isBluetoothEnabled.
    if (state == BluetoothAdapterState.on) {
      FFAppState().isBluetoothEnabled = true;
    } else {
      FFAppState().isBluetoothEnabled = false;
    }
  });
}
