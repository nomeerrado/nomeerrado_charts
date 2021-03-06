import 'package:flutter/material.dart';
import 'package:nomeerrado_charts/charts.dart';

var selectedId = 0;

class BarChartHorizontalSerie extends StatefulWidget {
  final List<BarHorizontalSerieModel> dataSet;
  final double boxWidth;
  final double boxHeight;
  final double barThickness;
  final TextStyle? valueStyle;
  final bool? showValue;
  final bool percentSymbol;
  final bool border;
  final Color? barColor;
  final Color? backgroundColor;
  final bool transparentBackground;
  final TextStyle? label2Style;
  final bool? label2UpperSide;
  final Color? selectedColor;

  const BarChartHorizontalSerie({
    Key? key,
    required this.dataSet,
    this.boxWidth = 0.0,
    this.boxHeight = 0.0,
    this.barThickness = 45.0,
    this.valueStyle,
    this.showValue = true,
    this.percentSymbol = true,
    this.border = true,
    this.barColor,
    this.backgroundColor,
    this.transparentBackground = true,
    this.label2Style,
    this.label2UpperSide = true,
    this.selectedColor,
  }) : super(key: key);

  @override
  State<BarChartHorizontalSerie> createState() =>
      _BarChartHorizontalSerieState();
}

class _BarChartHorizontalSerieState extends State<BarChartHorizontalSerie> {
  @override
  Widget build(BuildContext context) {
    return _barChart(
      dataSet: widget.dataSet,
      boxWidth: widget.boxWidth,
      boxHeight: widget.boxHeight,
      barThickness: widget.barThickness,
      border: widget.border,
      percentSymbol: widget.percentSymbol,
      backgroundColor: widget.backgroundColor,
      barColor: widget.barColor,
      valueStyle: widget.valueStyle,
      showValue: widget.showValue,
      transparentBackground: widget.transparentBackground,
      label2Style: widget.label2Style,
      label2UpperSide: widget.label2UpperSide,
      selectedColor: widget.selectedColor,
    );
  }

  Widget _barChart({
    required List<BarHorizontalSerieModel> dataSet,
    required double boxWidth,
    required double boxHeight,
    required double barThickness,
    required bool border,
    required bool transparentBackground,
    required bool percentSymbol,
    bool? showValue,
    Color? barColor,
    Color? backgroundColor,
    TextStyle? valueStyle,
    TextStyle? label2Style,
    bool? label2UpperSide,
    Color? selectedColor,
  }) {
    var _chartHeight = 50.0;
    var _children = <Widget>[];
    for (var e in dataSet) {
      _chartHeight += (barThickness + 15);

      _children.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selectedId = e.id!;
            });
            e.fn?.call();
          },
          child: BarChartHorizontal(
            percent: e.percent ?? 0.0,
            barColor: selectedId == e.id ? selectedColor : barColor,
            boxWidth: boxWidth,
            barThickness: barThickness,
            value: e.value ?? 0.0,
            label2: e.label ?? '',
            label2Style: label2Style?.copyWith(
                color: selectedId == e.id ? selectedColor : barColor),
            valueStyle: valueStyle?.copyWith(
                color: selectedId == e.id ? selectedColor : barColor),
            backgroundColor: backgroundColor,
            border: border,
            label2UpperSide: label2UpperSide,
            percentSymbol: percentSymbol,
            showValue: showValue,
            transparentBackground: transparentBackground,
          ),
        ),
      );
    }
    return SizedBox(
      height: boxHeight == 0 ? _chartHeight : boxHeight,
      child: ListView(children: _children),
    );
  }
}
