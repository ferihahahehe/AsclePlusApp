import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'my_journey_widget.dart' show MyJourneyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MyJourneyModel extends FlutterFlowModel<MyJourneyWidget> {
  ///  Local state fields for this page.

  JourneyPageDataStruct? journeyData;
  void updateJourneyDataStruct(Function(JourneyPageDataStruct) updateFn) {
    updateFn(journeyData ??= JourneyPageDataStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - prepareJourneyData] action in MyJourney widget.
  JourneyPageDataStruct? journeyDataOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
