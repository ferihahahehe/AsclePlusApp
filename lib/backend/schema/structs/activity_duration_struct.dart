// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivityDurationStruct extends BaseStruct {
  ActivityDurationStruct({
    String? activityName,
    double? goodDuration,
    double? badDuration,
  })  : _activityName = activityName,
        _goodDuration = goodDuration,
        _badDuration = badDuration;

  // "activityName" field.
  String? _activityName;
  String get activityName => _activityName ?? '';
  set activityName(String? val) => _activityName = val;

  bool hasActivityName() => _activityName != null;

  // "goodDuration" field.
  double? _goodDuration;
  double get goodDuration => _goodDuration ?? 0.0;
  set goodDuration(double? val) => _goodDuration = val;

  void incrementGoodDuration(double amount) =>
      goodDuration = goodDuration + amount;

  bool hasGoodDuration() => _goodDuration != null;

  // "badDuration" field.
  double? _badDuration;
  double get badDuration => _badDuration ?? 0.0;
  set badDuration(double? val) => _badDuration = val;

  void incrementBadDuration(double amount) =>
      badDuration = badDuration + amount;

  bool hasBadDuration() => _badDuration != null;

  static ActivityDurationStruct fromMap(Map<String, dynamic> data) =>
      ActivityDurationStruct(
        activityName: data['activityName'] as String?,
        goodDuration: castToType<double>(data['goodDuration']),
        badDuration: castToType<double>(data['badDuration']),
      );

  static ActivityDurationStruct? maybeFromMap(dynamic data) => data is Map
      ? ActivityDurationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'activityName': _activityName,
        'goodDuration': _goodDuration,
        'badDuration': _badDuration,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'activityName': serializeParam(
          _activityName,
          ParamType.String,
        ),
        'goodDuration': serializeParam(
          _goodDuration,
          ParamType.double,
        ),
        'badDuration': serializeParam(
          _badDuration,
          ParamType.double,
        ),
      }.withoutNulls;

  static ActivityDurationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ActivityDurationStruct(
        activityName: deserializeParam(
          data['activityName'],
          ParamType.String,
          false,
        ),
        goodDuration: deserializeParam(
          data['goodDuration'],
          ParamType.double,
          false,
        ),
        badDuration: deserializeParam(
          data['badDuration'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ActivityDurationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ActivityDurationStruct &&
        activityName == other.activityName &&
        goodDuration == other.goodDuration &&
        badDuration == other.badDuration;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([activityName, goodDuration, badDuration]);
}

ActivityDurationStruct createActivityDurationStruct({
  String? activityName,
  double? goodDuration,
  double? badDuration,
}) =>
    ActivityDurationStruct(
      activityName: activityName,
      goodDuration: goodDuration,
      badDuration: badDuration,
    );
