// ignore_for_file: overridden_fields


import 'package:book_library/features/book/data/model/book_detail_model.dart';
import 'package:book_library/features/book/domain/entities/item_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final BookModelDetail? volumeInfo;

  const ItemModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
  });

ItemEntity toModel() {
  return ItemEntity(
    kind: kind,
    id: id,
    etag: etag,
    selfLink: selfLink,
  );
}

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
