// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookBaseModel _$BookBaseModelFromJson(Map<String, dynamic> json) =>
    BookBaseModel(
      title: json['title'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      imageLinks: json['imageLinks'] == null
          ? null
          : ImageLinksModel.fromJson(
              json['imageLinks'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>?)
          ?.map((e) =>
              IndustryIdentifierModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookBaseModelToJson(BookBaseModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'authors': instance.authors,
      'imageLinks': instance.imageLinks,
      'categories': instance.categories,
      'industryIdentifiers': instance.industryIdentifiers,
    };
