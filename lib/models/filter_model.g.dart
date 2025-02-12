// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
      brand:
          (json['brand'] as List<dynamic>?)?.map((e) => e as String).toList(),
      ram: (json['ram'] as List<dynamic>?)?.map((e) => e as String).toList(),
      storage:
          (json['storage'] as List<dynamic>?)?.map((e) => e as String).toList(),
      conditions: (json['conditions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      warranty: (json['warranty'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FilterModelToJson(FilterModel instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'ram': instance.ram,
      'storage': instance.storage,
      'conditions': instance.conditions,
      'warranty': instance.warranty,
    };
