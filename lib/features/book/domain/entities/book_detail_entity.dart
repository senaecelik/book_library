import 'package:book_library/features/book/domain/entities/image_links_entity.dart';
import 'package:book_library/features/book/domain/entities/industry_identifier_entity.dart';

class BookEntityDetail {
  final String? title;
  final List<String>? authors;
  final List<IndustryIdentifierEntity>? industryIdentifiers;
  final ImageLinksEntity? imageLinks;
  final List<String>? categories;
  final String? publishedDate;
  final String? publisher;
  final String? description;
  final int? pageCount;
  final String? printType;
  final double? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  const BookEntityDetail({
    this.title,
    this.authors,
    this.industryIdentifiers,
    this.imageLinks,
    this.categories,
    this.publishedDate,
    this.publisher,
    this.description,
    this.pageCount,
    this.printType,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });
}
