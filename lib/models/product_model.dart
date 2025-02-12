import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String? id;
  final String? deviceCondition;
  final String? listedBy;
  final String? deviceStorage;
  final List<ImageModel>? images;
  final DefaultImageModel? defaultImage;
  final String? listingState;
  final String? listingLocation;
  final String? listingLocality;
  final String? listingPrice;
  final String? make;
  final String? marketingName;
  final bool? openForNegotiation;
  final double? discountPercentage;
  final bool? verified;
  final String? listingId;
  final String? status;
  final String? verifiedDate;
  final String? listingDate;
  final String? deviceRam;
  final String? warranty;
  final String? imagePath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final LocationModel? location;
  final int? originalPrice;
  final int? discountedPrice;

  ProductModel({
    this.id,
    this.deviceCondition,
    this.listedBy,
    this.deviceStorage,
    this.images,
    this.defaultImage,
    this.listingState,
    this.listingLocation,
    this.listingLocality,
    this.listingPrice,
    this.make,
    this.marketingName,
    this.openForNegotiation,
    this.discountPercentage,
    this.verified,
    this.listingId,
    this.status,
    this.verifiedDate,
    this.listingDate,
    this.deviceRam,
    this.warranty,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
    this.location,
    this.originalPrice,
    this.discountedPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  static List<ProductModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ImageModel {
  final String? thumbImage;
  final String? fullImage;
  final String? isVarified;
  final String? option;
  final String? id;

  ImageModel({
    this.thumbImage,
    this.fullImage,
    this.isVarified,
    this.option,
    this.id,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}

@JsonSerializable()
class DefaultImageModel {
  final String? fullImage;
  final String? id;

  DefaultImageModel({
    this.fullImage,
    this.id,
  });

  factory DefaultImageModel.fromJson(Map<String, dynamic> json) =>
      _$DefaultImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultImageModelToJson(this);
}

@JsonSerializable()
class LocationModel {
  final String? type;
  final List<double>? coordinates;
  final String? id;

  LocationModel({
    this.type,
    this.coordinates,
    this.id,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
