// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqModel _$FaqModelFromJson(Map<String, dynamic> json) => FaqModel(
      id: json['_id'] as String?,
      question: json['question'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$FaqModelToJson(FaqModel instance) => <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
    };

FaqModelResponse _$FaqModelResponseFromJson(Map<String, dynamic> json) =>
    FaqModelResponse(
      faqModels: (json['FAQs'] as List<dynamic>?)
          ?.map((e) => FaqModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FaqModelResponseToJson(FaqModelResponse instance) =>
    <String, dynamic>{
      'FAQs': instance.faqModels,
    };
