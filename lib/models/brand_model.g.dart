// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => BrandModel(
      make: json['make'] as String?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$BrandModelToJson(BrandModel instance) =>
    <String, dynamic>{
      'make': instance.make,
      'imagePath': instance.imagePath,
    };

BrandModelResponse _$BrandModelResponseFromJson(Map<String, dynamic> json) =>
    BrandModelResponse(
      brandsModel: (json['dataObject'] as List<dynamic>?)
          ?.map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BrandModelResponseToJson(BrandModelResponse instance) =>
    <String, dynamic>{
      'dataObject': instance.brandsModel,
    };
