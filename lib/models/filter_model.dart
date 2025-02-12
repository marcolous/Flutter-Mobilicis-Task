import 'package:json_annotation/json_annotation.dart';

part 'filter_model.g.dart';

@JsonSerializable()
class FilterModel {
  final List<String> brand;
  final List<String> ram;
  final List<String> storage;
  final List<String> conditions;
  final List<String> warranty;

  FilterModel({
    required this.brand,
    required this.ram,
    required this.storage,
    required this.conditions,
    required this.warranty,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) => _$FilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilterModelToJson(this);
}
