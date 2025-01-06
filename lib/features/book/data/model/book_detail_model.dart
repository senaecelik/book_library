import 'package:book_library/features/book/data/model/image_link_model.dart';
import 'package:book_library/features/book/data/model/industry_identifier_model.dart';
import 'package:book_library/features/book/domain/entities/book_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_detail_model.g.dart';

@JsonSerializable()
class BookModelDetail  {
  final String? title;
  final List<String>? authors;
  final String? publishedDate;
  final String? publisher;
  final String? description;
  final List<IndustryIdentifierModel>? industryIdentifiers;
  final int? pageCount;
  final String? printType;
  final double? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final ImageLinksModel? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;
  final List<String>? categories;
  const BookModelDetail({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.pageCount,
    this.printType,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
    this.categories,
  });

BookEntityDetail toModel() {
  return BookEntityDetail(
    title: title ?? '', // title null ise boş string atıyoruz
    authors: authors ?? [],
    industryIdentifiers: industryIdentifiers?.map((e) => e.toModel()).toList() ?? [], // industryIdentifiers listesini dönüştürüyoruz
    imageLinks: imageLinks?.toModel(), // imageLinks null değilse toModel() fonksiyonunu çağırıyoruz
    categories: categories ?? [],
    publishedDate: publishedDate,
    publisher: publisher,
    description: description,
    pageCount: pageCount,
    printType: printType,
    averageRating: averageRating,
    ratingsCount: ratingsCount,
    maturityRating: maturityRating,
    allowAnonLogging: allowAnonLogging,
    contentVersion: contentVersion,
    language: language,
    previewLink: previewLink,
    infoLink: infoLink,
    canonicalVolumeLink: canonicalVolumeLink,
  );
}
factory BookModelDetail.fromEntity(BookEntityDetail entity) {
  return BookModelDetail(
    title: entity.title,
    authors: entity.authors ?? [],
    publishedDate: entity.publishedDate,
    publisher: entity.publisher,
    description: entity.description,
    industryIdentifiers: entity.industryIdentifiers == null
        ? []
        : entity.industryIdentifiers!.map((id) => IndustryIdentifierModel.fromEntity(id)).toList(),
    pageCount: entity.pageCount,
    printType: entity.printType,
    averageRating: entity.averageRating,
    ratingsCount: entity.ratingsCount,
    maturityRating: entity.maturityRating,
    allowAnonLogging: entity.allowAnonLogging,
    contentVersion: entity.contentVersion,
    imageLinks: entity.imageLinks != null ? ImageLinksModel.fromEntity(entity.imageLinks!) : null,
    language: entity.language,
    previewLink: entity.previewLink,
    infoLink: entity.infoLink,
    canonicalVolumeLink: entity.canonicalVolumeLink,
    categories: entity.categories ?? [],
  );
}


  factory BookModelDetail.fromJson(Map<String, dynamic> json) => _$BookModelDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelDetailToJson(this);
 


}
