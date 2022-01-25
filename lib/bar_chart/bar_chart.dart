import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final double boxHeight;
  final double barThickness;
  final double value;
  final bool percentSymbol;
  final bool border;
  final String? innerLabel;
  final Color? barColor;
  final Color? backgroundColor;

  const BarChart({
    Key? key,
    this.boxHeight = 100.0,
    this.barThickness = 45.0,
    this.value = 0.0,
    this.percentSymbol = true,
    this.border = true,
    this.innerLabel,
    this.barColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _barChart(
      boxHeight: boxHeight,
      barThickness: barThickness,
      border: border,
      percentSymbol: percentSymbol,
      backgroundColor: backgroundColor,
      barColor: barColor,
      value: value,
      innerLabel: innerLabel,
    );
  }
}

Widget _barChart({
  required double boxHeight,
  required double barThickness,
  required double value,
  required bool percentSymbol,
  required bool border,
  String? innerLabel,
  Color? barColor,
  Color? backgroundColor,
}) {
  final barSize = (value * boxHeight) / 100;
  return Container(
    width: barThickness,
    height: boxHeight,
    color: backgroundColor ?? Colors.orange[100],
    alignment: Alignment.bottomLeft,
    child: Stack(
      children: [
        Positioned(
          bottom: barSize > 5
              ? value < 5
                  ? 0
                  : null
              : 0,
          child: Container(
            height: barSize > 0 ? barSize : 0,
            width: barThickness,
            decoration: BoxDecoration(
              color: barColor ?? Colors.blue,
              border: border
                  ? Border.all(
                      width: 0.5, color: barColor ?? Colors.blue.shade900)
                  : null,
            ),
          ),
        ),
        Positioned(
          top: barSize > 5
              ? value < 5
                  ? null
                  : -5
              : null,
          child: Container(
            width: barThickness,
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(
                innerLabel != null
                    ? percentSymbol
                        ? '$innerLabel%'
                        : innerLabel
                    : '',
                style: const TextStyle(fontSize: 10.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
