// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyActivitySummaryStruct extends BaseStruct {
  DailyActivitySummaryStruct({
    DateTime? date,
    List<ActivityDurationStruct>? activityDurations,
  })  : _date = date,
        _activityDurations = activityDurations;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "activityDurations" field.
  List<ActivityDurationStruct>? _activityDurations;
  List<ActivityDurationStruct> get activityDurations =>
      _activityDurations ?? const [];
  set activityDurations(List<ActivityDurationStruct>? val) =>
      _activityDurations = val;

  void updateActivityDurations(
      Function(List<ActivityDurationStruct>) updateFn) {
    updateFn(_activityDurations ??= []);
  }

  bool hasActivityDurations() => _activityDurations != null;

  static DailyActivitySummaryStruct fromMap(Map<String, dynamic> data) =>
      DailyActivitySummaryStruct(
        date: data['date'] as DateTime?,
        activityDurations: getStructList(
          data['activityDurations'],
          ActivityDurationStruct.fromMap,
        ),
      );

  static DailyActivitySummaryStruct? maybeFromMap(dynamic data) => data is Map
      ? DailyActivitySummaryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'activityDurations': _activityDurations?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'activityDurations': serializeParam(
          _activityDurations,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DailyActivitySummaryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DailyActivitySummaryStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        activityDurations: deserializeStructParam<ActivityDurationStruct>(
          data['activityDurations'],
          ParamType.DataStruct,
          true,
          structBuilder: ActivityDurationStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DailyActivitySummaryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DailyActivitySummaryStruct &&
        date == other.date &&
        listEquality.equals(activityDurations, other.activityDurations);
  }

  @override
  int get hashCode => const ListEquality().hash([date, activityDurations]);
}

DailyActivitySummaryStruct createDailyActivitySummaryStruct({
  DateTime? date,
}) =>
    DailyActivitySummaryStruct(
      date: date,
    );
