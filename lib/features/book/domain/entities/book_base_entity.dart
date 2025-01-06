

import 'package:book_library/features/book/domain/entities/image_links_entity.dart';
import 'package:book_library/features/book/domain/entities/industry_identifier_entity.dart';

class BookBaseEntity {
  final String? title;
  final List<String>? authors;
  final List<IndustryIdentifierEntity>? industryIdentifiers;
  final ImageLinksEntity? imageLinks;
  final List<String>? categories;
  
  const BookBaseEntity({
    required this.title,
   required this.authors,
   required this.industryIdentifiers,
   required this.imageLinks,
   required this.categories,
   
  });

  // // Modelden Entity'e dönüşüm metodu
  // static BookBaseModel fromEntity(BookBaseEntity entity) {
  //   return BookBaseModel(
  //     title: entity.title,
  //     authors: entity.authors,
    
  //     imageLinks: entity.imageLinks != null
  //         ? ImageLinksModel.fromEntity(entity.imageLinks!)
  //         : null,
  //     categories: entity.categories,
  //     industryIdentifiers: entity.industryIdentifiers?.map((id) => IndustryIdentifierModel.fromEntity(id))
  //             .toList(),
  //   );
  // }
}
