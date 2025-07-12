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

import 'dart:math';
import 'package:intl/intl.dart';

Future<JourneyPageDataStruct> prepareJourneyData(
  List<DailyActivitySummaryStruct> allSummaries,
  List<ActivityDurationStruct> todaySummary, // Argumen baru
) async {
  final result = JourneyPageDataStruct(
    dayLabels: [],
    idleGood: [],
    idleBad: [],
    walkingGood: [],
    walkingBad: [],
    runningGood: [],
    runningBad: [],
    stairsUpGood: [],
    stairsUpBad: [],
    stairsDownGood: [],
    stairsDownBad: [],
    weeklyTotalGood: 0.0,
    weeklyTotalBad: 0.0,
  );

  final now = DateTime.now();
  final activityNames = [
    'Idle',
    'Walking',
    'Running',
    'Stairs Up',
    'Stairs Down'
  ];
  final dataMap = {
    'Idle': {'good': <double>[], 'bad': <double>[]},
    'Walking': {'good': <double>[], 'bad': <double>[]},
    'Running': {'good': <double>[], 'bad': <double>[]},
    'Stairs Up': {'good': <double>[], 'bad': <double>[]},
    'Stairs Down': {'good': <double>[], 'bad': <double>[]},
  };

  double totalGood = 0;
  double totalBad = 0;

  for (int i = 6; i >= 0; i--) {
    final targetDate =
        DateTime(now.year, now.month, now.day).subtract(Duration(days: i));
    result.dayLabels.add(DateFormat('EEE').format(targetDate)); // e.g., 'Mon'

    List<ActivityDurationStruct> dailyActivities;

    // Jika i == 0, berarti ini adalah hari ini. Ambil data dari 'todaySummary'.
    if (i == 0) {
      dailyActivities = todaySummary;
    } else {
      // Jika bukan hari ini, cari data di riwayat 'allSummaries'.
      final dailySummary = allSummaries.firstWhere(
        (s) =>
            s.hasDate() &&
            s.date!.year == targetDate.year &&
            s.date!.month == targetDate.month &&
            s.date!.day == targetDate.day,
        orElse: () => DailyActivitySummaryStruct(),
      );
      dailyActivities = dailySummary.activityDurations;
    }

    for (var activityName in activityNames) {
      final activityData = dailyActivities.firstWhere(
        (ad) => ad.activityName == activityName,
        orElse: () => ActivityDurationStruct(),
      );

      final goodDuration = activityData.goodDuration;
      final badDuration = activityData.badDuration;

      dataMap[activityName]!['good']!.add(goodDuration);
      dataMap[activityName]!['bad']!.add(badDuration);

      totalGood += goodDuration;
      totalBad += badDuration;
    }
  }

  // Assign the collected data to the result struct
  result.idleGood = dataMap['Idle']!['good']!;
  result.idleBad = dataMap['Idle']!['bad']!;
  result.walkingGood = dataMap['Walking']!['good']!;
  result.walkingBad = dataMap['Walking']!['bad']!;
  result.runningGood = dataMap['Running']!['good']!;
  result.runningBad = dataMap['Running']!['bad']!;
  result.stairsUpGood = dataMap['Stairs Up']!['good']!;
  result.stairsUpBad = dataMap['Stairs Up']!['bad']!;
  result.stairsDownGood = dataMap['Stairs Down']!['good']!;
  result.stairsDownBad = dataMap['Stairs Down']!['bad']!;

  result.weeklyTotalGood = totalGood;
  result.weeklyTotalBad = totalBad;

  return result;
}
