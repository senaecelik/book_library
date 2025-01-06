import 'package:equatable/equatable.dart';

class ImageLinksEntity extends Equatable {
  final String? smallThumbnail;
  final String? thumbnail;

  const ImageLinksEntity({
    this.smallThumbnail,
    this.thumbnail,
  });

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];
}

