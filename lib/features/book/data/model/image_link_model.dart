// ignore_for_file: overridden_fields

import 'package:book_library/features/book/domain/entities/image_links_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_link_model.g.dart';

@JsonSerializable()
class ImageLinksModel {
  final String? smallThumbnail;
  final String? thumbnail;

  const ImageLinksModel({
    this.smallThumbnail,
    this.thumbnail,
  });

 factory ImageLinksModel.fromEntity(ImageLinksEntity entity) {
    return ImageLinksModel(
      smallThumbnail: entity.smallThumbnail,
      thumbnail: entity.thumbnail,
    );
  }

ImageLinksEntity toModel() {
    return ImageLinksEntity(
      smallThumbnail: smallThumbnail,
      thumbnail: thumbnail,
    );
  }
  
  factory ImageLinksModel.fromJson(Map<String, dynamic> json) => _$ImageLinksModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinksModelToJson(this);
}
