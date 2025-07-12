// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// ignore_for_file: unnecessary_getters_setters
import 'package:intl/intl.dart';

Future<void> processAndStoreDailyHistory() async {
  final now = DateTime.now();
  final todayString = DateFormat('yyyy-MM-dd').format(now);
  final lastDateString = FFAppState().lastProcessingDate;

  // Hanya jalankan jika hari telah berganti dan ada data untuk diarsipkan.
  if (lastDateString.isNotEmpty &&
      lastDateString != todayString &&
      FFAppState().globalActivityDurations.isNotEmpty) {
    print('New day detected. Archiving data for $lastDateString.');

    final lastDate = DateFormat('yyyy-MM-dd').parse(lastDateString);

    // Data di globalActivityDurations adalah ringkasan final untuk hari kemarin.
    final finalDaySummary = FFAppState().globalActivityDurations.toList();

    // Buat objek riwayat baru.
    final dailyHistoryEntry = DailyActivitySummaryStruct(
      date: lastDate,
      activityDurations: finalDaySummary,
    );

    // Simpan ke dalam daftar arsip permanen.
    FFAppState().addToHistoricalSummaries(dailyHistoryEntry);

    // Kosongkan data durasi untuk hari yang baru.
    FFAppState().globalActivityDurations = [];

    // Update tanggal pemrosesan terakhir ke hari ini.
    FFAppState().lastProcessingDate = todayString;
  } else if (lastDateString.isEmpty) {
    // Jika ini adalah pertama kalinya aplikasi berjalan, set tanggalnya saja.
    FFAppState().lastProcessingDate = todayString;
  }
}
