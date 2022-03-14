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
  final TextStyle? labelStyle;
  final bool transparentBackground;
  final bool showInnerLabel;
  final String? bottomLabel1;
  final String? bottomLabel2;
  final TextStyle? bottomLabel1Style;
  final TextStyle? bottomLabel2Style;

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
    this.labelStyle,
    this.transparentBackground = true,
    this.showInnerLabel = true,
    this.bottomLabel1,
    this.bottomLabel2,
    this.bottomLabel1Style,
    this.bottomLabel2Style,
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
      labelStyle: labelStyle,
      transparentBackground: transparentBackground,
      showInnerLabel: showInnerLabel,
      bottomLabel1: bottomLabel1,
      bottomLabel2: bottomLabel2,
      bottomLabel1Style: bottomLabel1Style,
      bottomLabel2Style: bottomLabel2Style,
    );
  }
}

Widget _barChart({
  required double boxHeight,
  required double barThickness,
  required double value,
  required bool percentSymbol,
  required bool border,
  required bool transparentBackground,
  required bool showInnerLabel,
  String? innerLabel,
  Color? barColor,
  Color? backgroundColor,
  TextStyle? labelStyle,
  String? bottomLabel1,
  String? bottomLabel2,
  TextStyle? bottomLabel1Style,
  TextStyle? bottomLabel2Style,
}) {
  const defaultLabelStyle = TextStyle(fontSize: 10.0, color: Colors.white);
  final bottomLabelHeight =
      (bottomLabel1 != null ? 15 : 0) + (bottomLabel2 != null ? 15 : 0);
  final barSize = (value * (boxHeight - (bottomLabelHeight))) / 100;

  return Container(
    width: barThickness,
    height: boxHeight + 16,
    alignment: Alignment.bottomLeft,
    child: Column(
      children: [
        Container(
          width: barThickness,
          height: boxHeight - bottomLabelHeight,
          color: transparentBackground && backgroundColor == null
              ? Colors.transparent
              : backgroundColor ?? Colors.orange[100],
          alignment: Alignment.bottomLeft,
          child: Stack(
            children: [
              Positioned(
                bottom: barSize > 10
                    ? value < 10
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
              Visibility(
                visible: showInnerLabel,
                child: Positioned(
                  top: barSize > 10
                      ? value < 10
                          ? null
                          : -4.5
                      : null,
                  child: Container(
                    width: barThickness,
                    padding: const EdgeInsets.all(5),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        showInnerLabel
                            ? innerLabel != null
                                ? percentSymbol
                                    ? '$innerLabel%'
                                    : innerLabel
                                : percentSymbol
                                    ? '${value.toStringAsFixed(0)}%'
                                    : ''
                            : '',
                        style: barSize > 12
                            ? labelStyle ?? defaultLabelStyle
                            : labelStyle != null
                                ? labelStyle.copyWith(color: Colors.black54)
                                : defaultLabelStyle.copyWith(
                                    color: Colors.black54),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: bottomLabel1 != null,
          child: Text(
            bottomLabel1 ?? '',
            style: bottomLabel1Style,
          ),
        ),
        Visibility(
          visible: bottomLabel2 != null,
          child: Text(
            bottomLabel2 ?? '',
            style: bottomLabel2Style,
          ),
        ),
      ],
    ),
  );
}
