import 'package:json_annotation/json_annotation.dart';

part 'filter_model.g.dart';

@JsonSerializable()
class FilterModel {
  final List<String>? brand;
  final List<String>? ram;
  final List<String>? storage;
  final List<String>? conditions;
  final List<String>? warranty;

  const FilterModel({
    this.brand,
    this.ram,
    this.storage,
    this.conditions,
    this.warranty,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilterModelToJson(this);
}
