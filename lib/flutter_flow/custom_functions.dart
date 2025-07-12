import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<double> convertHoursListToMinutes(List<double>? durationsInHours) {
  if (durationsInHours == null) {
    return [];
  }
  return durationsInHours.map((hour) => hour * 60).toList();
}
