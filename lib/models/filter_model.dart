import 'package:json_annotation/json_annotation.dart';

part 'filter_model.g.dart';

@JsonSerializable()
class FilterModel {
  @JsonKey(name: 'Brand')
  List<String>? brand;

  @JsonKey(name: 'Ram')
  List<String>? ram;

  @JsonKey(name: 'Storage')
  List<String>? storage;

  @JsonKey(name: 'Conditions')
  List<String>? conditions;

  @JsonKey(name: 'Warranty')
  List<String>? warranty;

  List<double>? priceRange;
  bool? verified;
  Map<String, dynamic>? sort;
  int? page;

  FilterModel({
    this.brand = const [],
    this.conditions = const [],
    this.priceRange = const [],
    this.ram = const [],
    this.storage = const [],
    this.warranty = const [],
    this.sort = const {},
    this.verified = true,
    this.page = 1,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);
  Map<String, dynamic> toJson() {
    return {
      'make': brand,
      'ram': ram,
      'storage': storage,
      'condition': conditions,
      'warranty': warranty,
      'priceRange': priceRange,
      'verified': verified,
      'sort': sort,
      'page': page,
    };
  }
}
