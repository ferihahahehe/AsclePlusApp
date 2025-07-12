// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostureLogStruct extends BaseStruct {
  PostureLogStruct({
    DateTime? timestamp,
    String? activityName,
    int? flexAngle,
    String? condition,
  })  : _timestamp = timestamp,
        _activityName = activityName,
        _flexAngle = flexAngle,
        _condition = condition;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "activityName" field.
  String? _activityName;
  String get activityName => _activityName ?? '';
  set activityName(String? val) => _activityName = val;

  bool hasActivityName() => _activityName != null;

  // "flexAngle" field.
  int? _flexAngle;
  int get flexAngle => _flexAngle ?? 0;
  set flexAngle(int? val) => _flexAngle = val;

  void incrementFlexAngle(int amount) => flexAngle = flexAngle + amount;

  bool hasFlexAngle() => _flexAngle != null;

  // "condition" field.
  String? _condition;
  String get condition => _condition ?? '';
  set condition(String? val) => _condition = val;

  bool hasCondition() => _condition != null;

  static PostureLogStruct fromMap(Map<String, dynamic> data) =>
      PostureLogStruct(
        timestamp: data['timestamp'] as DateTime?,
        activityName: data['activityName'] as String?,
        flexAngle: castToType<int>(data['flexAngle']),
        condition: data['condition'] as String?,
      );

  static PostureLogStruct? maybeFromMap(dynamic data) => data is Map
      ? PostureLogStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'timestamp': _timestamp,
        'activityName': _activityName,
        'flexAngle': _flexAngle,
        'condition': _condition,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'activityName': serializeParam(
          _activityName,
          ParamType.String,
        ),
        'flexAngle': serializeParam(
          _flexAngle,
          ParamType.int,
        ),
        'condition': serializeParam(
          _condition,
          ParamType.String,
        ),
      }.withoutNulls;

  static PostureLogStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostureLogStruct(
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        activityName: deserializeParam(
          data['activityName'],
          ParamType.String,
          false,
        ),
        flexAngle: deserializeParam(
          data['flexAngle'],
          ParamType.int,
          false,
        ),
        condition: deserializeParam(
          data['condition'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PostureLogStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PostureLogStruct &&
        timestamp == other.timestamp &&
        activityName == other.activityName &&
        flexAngle == other.flexAngle &&
        condition == other.condition;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([timestamp, activityName, flexAngle, condition]);
}

PostureLogStruct createPostureLogStruct({
  DateTime? timestamp,
  String? activityName,
  int? flexAngle,
  String? condition,
}) =>
    PostureLogStruct(
      timestamp: timestamp,
      activityName: activityName,
      flexAngle: flexAngle,
      condition: condition,
    );
