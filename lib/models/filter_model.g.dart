// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
      brand:
          (json['Brand'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      conditions: (json['Conditions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      priceRange: (json['priceRange'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
      ram: (json['Ram'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      storage: (json['Storage'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      warranty: (json['Warranty'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sort: json['sort'] as Map<String, dynamic>? ?? const {},
      verified: json['verified'] as bool? ?? true,
      page: (json['page'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$FilterModelToJson(FilterModel instance) =>
    <String, dynamic>{
      'Brand': instance.brand,
      'Ram': instance.ram,
      'Storage': instance.storage,
      'Conditions': instance.conditions,
      'Warranty': instance.warranty,
      'priceRange': instance.priceRange,
      'verified': instance.verified,
      'sort': instance.sort,
      'page': instance.page,
    };
