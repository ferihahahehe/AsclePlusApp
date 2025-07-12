// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

/// Set your widget name, define your parameter, and then add the boilerplate
/// code using the green button on the right!
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class DynamicPieChart extends StatefulWidget {
  const DynamicPieChart({
    Key? key,
    this.width,
    this.height,
    required this.goodValue,
    required this.badValue,
    this.goodColor,
    this.badColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double goodValue;
  final double badValue;
  final Color? goodColor;
  final Color? badColor;

  @override
  _DynamicPieChartState createState() => _DynamicPieChartState();
}

class _DynamicPieChartState extends State<DynamicPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final totalValue = widget.goodValue + widget.badValue;

    if (totalValue <= 0) {
      return Container(
        width: widget.width,
        height: widget.height,
        child: Center(
            child:
                Text('No Data', style: FlutterFlowTheme.of(context).bodySmall)),
      );
    }

    final goodPercentage = (widget.goodValue / totalValue) * 100;

    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Teks Persentase di Tengah
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${goodPercentage.toStringAsFixed(0)}%',
                // --- PERUBAHAN UKURAN FONT TENGAH ---
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Roboto',
                      color: widget.goodColor ??
                          FlutterFlowTheme.of(context).success,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Good',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          ),
          // Pie Chart
          PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(show: false),
              sectionsSpace: 2,
              // --- PERUBAHAN UKURAN LUBANG DONAT ---
              centerSpaceRadius: 45,
              sections: showingSections(),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      // --- PERUBAHAN UKURAN RADIUS & FONT SLICE ---
      final double radius = isTouched ? 60.0 : 55.0; // Ukuran utama dikecilkan
      final double fontSize =
          isTouched ? 12.0 : 10.0; // Font label slice dikecilkan

      final total = widget.goodValue + widget.badValue;
      final percentage =
          (i == 0 ? widget.goodValue / total : widget.badValue / total) * 100;

      // Hanya tampilkan title jika persentase lebih dari 5% agar tidak terlalu ramai
      final title = percentage > 5 ? '${percentage.toStringAsFixed(0)}%' : '';

      switch (i) {
        case 0: // Good Data
          return PieChartSectionData(
            color: widget.goodColor ?? FlutterFlowTheme.of(context).success,
            value: widget.goodValue,
            title: title,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1: // Bad Data
          return PieChartSectionData(
            color: widget.badColor ?? FlutterFlowTheme.of(context).error,
            value: widget.badValue,
            title: title,
            radius:
                radius, // Radius disamakan agar tidak "meledak" secara default
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
