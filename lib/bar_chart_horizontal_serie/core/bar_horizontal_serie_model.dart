class BarHorizontalSerieModel {
  BarHorizontalSerieModel({
    this.id,
    this.label,
    this.value,
    this.percent,
    this.fn,
  });

  int? id;
  String? label;
  double? value;
  double? percent;
  Function()? fn;
}
