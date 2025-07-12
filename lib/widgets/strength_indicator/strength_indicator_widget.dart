import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'strength_indicator_model.dart';
export 'strength_indicator_model.dart';

class StrengthIndicatorWidget extends StatefulWidget {
  const StrengthIndicatorWidget({
    super.key,
    this.rssi,
    Color? color,
  }) : this.color = color ?? const Color(0x7F39D2C0);

  final int? rssi;
  final Color color;

  @override
  State<StrengthIndicatorWidget> createState() =>
      _StrengthIndicatorWidgetState();
}

class _StrengthIndicatorWidgetState extends State<StrengthIndicatorWidget> {
  late StrengthIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StrengthIndicatorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
              child: Container(
                width: 4.0,
                height: 7.0,
                decoration: BoxDecoration(
                  color: () {
                    if ((widget!.rssi! < -90) &&
                        FFAppState().isBluetoothEnabled) {
                      return FlutterFlowTheme.of(context).error;
                    } else if ((widget!.rssi! >= -90) &&
                        (widget!.rssi! < -60) &&
                        FFAppState().isBluetoothEnabled) {
                      return FlutterFlowTheme.of(context).warning;
                    } else if ((widget!.rssi! >= -60) &&
                        (widget!.rssi! < -50) &&
                        FFAppState().isBluetoothEnabled) {
                      return FlutterFlowTheme.of(context).warning;
                    } else if ((widget!.rssi! >= -50) &&
                        (widget!.rssi! < -1) &&
                        FFAppState().isBluetoothEnabled) {
                      return FlutterFlowTheme.of(context).success;
                    } else {
                      return FlutterFlowTheme.of(context).alternate;
                    }
                  }(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
              child: Container(
                width: 4.0,
                height: 11.0,
                decoration: BoxDecoration(
                  color: () {
                    if ((widget!.rssi! < -90) &&
                        FFAppState().isBluetoothEnabled) {
                      return FlutterFlowTheme.of(context).alternate;
                    } else if ((widget!.rssi! >= -90) &&
                        (widget!.rssi! < -60) &&
                        FFAppState().isBluetoothEnabled) {
                      return FlutterFlowTheme.of(context).warning;
                    } else if ((widget!.rssi! >= -60) &&
                        (widget!.rssi! < -50) &&
                        FFAppState().isBluetoothEnabled) {
                      return FlutterFlowTheme.of(context).warning;
                    } else if ((widget!.rssi! >= -50) &&
                        (widget!.rssi! < -1) &&
                        FFAppState().isBluetoothEnabled) {
                      return FlutterFlowTheme.of(context).success;
                    } else {
                      return FlutterFlowTheme.of(context).alternate;
                    }
                  }(),
                  borderRadius: BorderRadius.circular(10.0),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
              child: Container(
                width: 4.0,
                height: 14.0,
                decoration: BoxDecoration(
                  color: () {
                    if ((widget!.rssi! < -90) &&
                        FFAppState().isBluetoothEnabled) {
                      return FlutterFlowTheme.of(context).alternate;
                    } else if ((widget!.rssi! >= -90) &&
                        (widget!.rssi! < -60) &&
                        FFAppState().isBluetoothEnabled) {
                      return FlutterFlowTheme.of(context).alternate;
                    } else if ((widget!.rssi! >= -60) &&
                        (widget!.rssi! < -50) &&
                        FFAppState().isBluetoothEnabled) {
                      return FlutterFlowTheme.of(context).warning;
                    } else if ((widget!.rssi! >= -50) &&
                        (widget!.rssi! < -1) &&
                        FFAppState().isBluetoothEnabled) {
                      return FlutterFlowTheme.of(context).success;
                    } else {
                      return FlutterFlowTheme.of(context).alternate;
                    }
                  }(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Container(
              width: 4.0,
              height: 17.0,
              decoration: BoxDecoration(
                color: () {
                  if ((widget!.rssi! < -90) &&
                      FFAppState().isBluetoothEnabled) {
                    return FlutterFlowTheme.of(context).alternate;
                  } else if ((widget!.rssi! >= -90) &&
                      (widget!.rssi! < -60) &&
                      FFAppState().isBluetoothEnabled) {
                    return FlutterFlowTheme.of(context).alternate;
                  } else if ((widget!.rssi! >= -60) &&
                      (widget!.rssi! < -50) &&
                      FFAppState().isBluetoothEnabled) {
                    return FlutterFlowTheme.of(context).alternate;
                  } else if ((widget!.rssi! >= -50) &&
                      (widget!.rssi! < -1) &&
                      FFAppState().isBluetoothEnabled) {
                    return FlutterFlowTheme.of(context).success;
                  } else {
                    return FlutterFlowTheme.of(context).alternate;
                  }
                }(),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
