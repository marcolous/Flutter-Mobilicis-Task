import 'package:json_annotation/json_annotation.dart';

part 'faq_model.g.dart';

@JsonSerializable()
class FaqModel {
  @JsonKey(name: "_id")
  final String id;
  final String question;
  final String answer;

  FaqModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);
  Map<String, dynamic> toJson() => _$FaqModelToJson(this);
}

@JsonSerializable()
class FaqModelResponse {
  final List<FaqModel> faqModels;

  FaqModelResponse({required this.faqModels});

  factory FaqModelResponse.fromJson(Map<String, dynamic> json) =>
      _$FaqModelResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FaqModelResponseToJson(this);
}
