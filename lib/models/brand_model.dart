import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class BrandModel {
  final String? make;
  final String? imagePath;

  const BrandModel({this.make, this.imagePath});

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  static List<BrandModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => BrandModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}

@JsonSerializable()
class BrandModelResponse {
  @JsonKey(name: 'dataObject')
  final List<BrandModel>? brandsModel;

  const BrandModelResponse({this.brandsModel});

  factory BrandModelResponse.fromJson(Map<String, dynamic> json) {
    return BrandModelResponse(
      brandsModel: (json['FAQs'] as List<dynamic>?)
          ?.map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
