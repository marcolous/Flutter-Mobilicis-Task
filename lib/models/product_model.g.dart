// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String?,
      deviceCondition: json['deviceCondition'] as String?,
      listedBy: json['listedBy'] as String?,
      deviceStorage: json['deviceStorage'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultImage: json['defaultImage'] == null
          ? null
          : DefaultImageModel.fromJson(
              json['defaultImage'] as Map<String, dynamic>),
      listingState: json['listingState'] as String?,
      listingLocation: json['listingLocation'] as String?,
      listingLocality: json['listingLocality'] as String?,
      listingPrice: json['listingPrice'] as String?,
      make: json['make'] as String?,
      marketingName: json['marketingName'] as String?,
      openForNegotiation: json['openForNegotiation'] as bool?,
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      verified: json['verified'] as bool?,
      listingId: json['listingId'] as String?,
      status: json['status'] as String?,
      verifiedDate: json['verifiedDate'] as String?,
      listingDate: json['listingDate'] as String?,
      deviceRam: json['deviceRam'] as String?,
      warranty: json['warranty'] as String?,
      imagePath: json['imagePath'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      originalPrice: (json['originalPrice'] as num?)?.toInt(),
      discountedPrice: (json['discountedPrice'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceCondition': instance.deviceCondition,
      'listedBy': instance.listedBy,
      'deviceStorage': instance.deviceStorage,
      'images': instance.images,
      'defaultImage': instance.defaultImage,
      'listingState': instance.listingState,
      'listingLocation': instance.listingLocation,
      'listingLocality': instance.listingLocality,
      'listingPrice': instance.listingPrice,
      'make': instance.make,
      'marketingName': instance.marketingName,
      'openForNegotiation': instance.openForNegotiation,
      'discountPercentage': instance.discountPercentage,
      'verified': instance.verified,
      'listingId': instance.listingId,
      'status': instance.status,
      'verifiedDate': instance.verifiedDate,
      'listingDate': instance.listingDate,
      'deviceRam': instance.deviceRam,
      'warranty': instance.warranty,
      'imagePath': instance.imagePath,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'location': instance.location,
      'originalPrice': instance.originalPrice,
      'discountedPrice': instance.discountedPrice,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      thumbImage: json['thumbImage'] as String?,
      fullImage: json['fullImage'] as String?,
      isVarified: json['isVarified'] as String?,
      option: json['option'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'thumbImage': instance.thumbImage,
      'fullImage': instance.fullImage,
      'isVarified': instance.isVarified,
      'option': instance.option,
      'id': instance.id,
    };

DefaultImageModel _$DefaultImageModelFromJson(Map<String, dynamic> json) =>
    DefaultImageModel(
      fullImage: json['fullImage'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DefaultImageModelToJson(DefaultImageModel instance) =>
    <String, dynamic>{
      'fullImage': instance.fullImage,
      'id': instance.id,
    };

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
      'id': instance.id,
    };
