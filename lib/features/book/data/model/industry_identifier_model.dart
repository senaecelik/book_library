// ignore_for_file: overridden_fields

import 'package:book_library/features/book/domain/entities/industry_identifier_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'industry_identifier_model.g.dart';

@JsonSerializable()
class IndustryIdentifierModel  {
  final String? type;
  final String? identifier;

  const IndustryIdentifierModel({
    this.type,
    this.identifier,
  });


  IndustryIdentifierEntity toModel() => IndustryIdentifierEntity(type: type, identifier: identifier);

factory IndustryIdentifierModel.fromEntity(IndustryIdentifierEntity entity) {
    return IndustryIdentifierModel(
      type: entity.type,
      identifier: entity.identifier,
    );
  }
  factory IndustryIdentifierModel.fromJson(Map<String, dynamic> json) => _$IndustryIdentifierModelFromJson(json);

  Map<String, dynamic> toJson() => _$IndustryIdentifierModelToJson(this);
  
}
