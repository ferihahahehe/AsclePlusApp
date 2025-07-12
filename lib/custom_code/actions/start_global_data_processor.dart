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
import 'dart:async';

class GlobalTimerManager {
  static Timer? _globalTimer;
  static void start(Future<void> Function() onTick) {
    // Jangan mulai timer baru jika sudah aktif.
    if (_globalTimer?.isActive ?? false) return;

    // Jalankan tugas sekali saat pertama kali dipanggil.
    onTick();

    // Kemudian jalankan setiap 60 detik.
    _globalTimer = Timer.periodic(Duration(seconds: 60), (timer) => onTick());
  }
}

Future<void> startGlobalDataProcessor() async {
  GlobalTimerManager.start(() async {
    // Secara periodik, periksa apakah hari sudah berganti untuk mengarsipkan data.
    await processAndStoreDailyHistory();

    // Perhitungan durasi harian (globalActivityDurations) sudah ditangani secara
    // real-time oleh `processAndAggregateDataBatch`.
    // Tidak perlu menjalankannya lagi di sini.
  });
}
