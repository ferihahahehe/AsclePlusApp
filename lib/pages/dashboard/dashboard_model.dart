import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/widgets/current_activity/current_activity_widget.dart';
import '/widgets/current_posture/current_posture_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Model for CurrentPosture component.
  late CurrentPostureModel currentPostureModel;
  // Model for CurrentActivity component.
  late CurrentActivityModel currentActivityModel;

  @override
  void initState(BuildContext context) {
    currentPostureModel = createModel(context, () => CurrentPostureModel());
    currentActivityModel = createModel(context, () => CurrentActivityModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    currentPostureModel.dispose();
    currentActivityModel.dispose();
  }
}
