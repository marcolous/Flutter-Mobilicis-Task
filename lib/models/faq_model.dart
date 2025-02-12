import 'package:json_annotation/json_annotation.dart';

part 'faq_model.g.dart';

@JsonSerializable()
class FaqModel {
  @JsonKey(name: "_id")
  final String? id;
  final String? question;
  final String? answer;

  const FaqModel({
    this.id,
    this.question,
    this.answer,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);
  Map<String, dynamic> toJson() => _$FaqModelToJson(this);
}

@JsonSerializable()
class FaqModelResponse {
  @JsonKey(name: "FAQs")
  final List<FaqModel>? faqModels;

  const FaqModelResponse({this.faqModels});

  factory FaqModelResponse.fromJson(Map<String, dynamic> json) {
    return FaqModelResponse(
      faqModels: (json['FAQs'] as List<dynamic>?)
          ?.map((e) => FaqModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => _$FaqModelResponseToJson(this);
}
