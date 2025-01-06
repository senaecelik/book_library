
// ignore_for_file: overridden_fields

import 'package:book_library/features/book/data/model/image_link_model.dart';
import 'package:book_library/features/book/data/model/industry_identifier_model.dart';
import 'package:book_library/features/book/domain/entities/book_base_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_base_model.g.dart';


@JsonSerializable()
class BookBaseModel  {
  
  final String? title;
  final List<String>? authors;
  final ImageLinksModel? imageLinks;
  final List<String>? categories;
  final List<IndustryIdentifierModel>? industryIdentifiers;

  const BookBaseModel({
    this.title,
    this.authors,
    this.imageLinks,
    this.categories,
    this.industryIdentifiers,
  });

BookBaseEntity toModel() {
  return BookBaseEntity(
  title: title,  
  authors: authors ?? [],
  industryIdentifiers: industryIdentifiers?.map((e) => e.toModel()).toList() ?? [], 
  imageLinks: imageLinks!.toModel(), 
  categories: categories ?? [],
);

}


  factory BookBaseModel.fromJson(Map<String, dynamic> json) => _$BookBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookBaseModelToJson(this);
 

}
