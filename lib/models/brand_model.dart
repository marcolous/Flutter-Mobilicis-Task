import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class BrandModel {
  final String make;
  final String imagePath;

  BrandModel({required this.make, required this.imagePath});

  factory BrandModel.fromJson(Map<String, dynamic> json) => _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}
