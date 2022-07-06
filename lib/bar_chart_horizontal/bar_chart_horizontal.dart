import 'package:flutter/material.dart';

class BarChartHorizontal extends StatelessWidget {
  final double boxWidth;
  final double barThickness;
  final double value;
  final TextStyle? valueStyle;
  final bool? showValue;
  final bool percentSymbol;
  final double percent;
  final bool border;
  final Color? barColor;
  final Color? backgroundColor;
  final bool transparentBackground;
  final String? label2;
  final TextStyle? label2Style;
  final bool? label2UpperSide;

  const BarChartHorizontal({
    Key? key,
    this.boxWidth = 0.0,
    this.barThickness = 45.0,
    this.value = 0.0,
    this.valueStyle,
    this.showValue = true,
    this.percentSymbol = true,
    this.percent = 0.0,
    this.border = true,
    this.barColor,
    this.backgroundColor,
    this.transparentBackground = true,
    this.label2,
    this.label2Style,
    this.label2UpperSide = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _barChart(
      boxWidth: boxWidth,
      barThickness: barThickness,
      border: border,
      percentSymbol: percentSymbol,
      percent: percent,
      backgroundColor: backgroundColor,
      barColor: barColor,
      value: value,
      valueStyle: valueStyle,
      showValue: showValue,
      transparentBackground: transparentBackground,
      label2: label2,
      label2Style: label2Style,
      label2UpperSide: label2UpperSide,
    );
  }
}

Widget _barChart({
  required double boxWidth,
  required double barThickness,
  required double value,
  required bool border,
  required bool transparentBackground,
  required bool percentSymbol,
  required double percent,
  bool? showValue,
  Color? barColor,
  Color? backgroundColor,
  TextStyle? valueStyle,
  String? label2,
  TextStyle? label2Style,
  bool? label2UpperSide,
}) {
  const defaultLabelStyle = TextStyle(fontSize: 12.0, color: Colors.white);
  final labelHeight = (label2 != null ? 30 : 0);
  final barSize = ((percent * (boxWidth - (showValue! ? 100 : 0))) / 100);

  return Container(
    width: boxWidth,
    height: barThickness + labelHeight,
    alignment: Alignment.bottomLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label2 != null && label2UpperSide!,
          child: Text(
            label2 ?? '',
            textScaleFactor: 1.3,
            style: label2Style ?? defaultLabelStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: barSize >= 0.0 ? barSize : 0.0,
              height: barThickness,
              decoration: BoxDecoration(
                color: barColor ?? Colors.blue,
                border: border
                    ? Border.all(
                        width: 0.5, color: barColor ?? Colors.blue.shade900)
                    : null,
              ),
            ),
            Visibility(
              visible: showValue,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '$value%',
                  textScaleFactor: 1.3,
                  style: valueStyle ?? defaultLabelStyle,
                ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: label2 != null && !label2UpperSide!,
          child: Text(
            label2 ?? '',
            textScaleFactor: 1.3,
            style: label2Style ?? defaultLabelStyle,
          ),
        ),
      ],
    ),
  );
}
