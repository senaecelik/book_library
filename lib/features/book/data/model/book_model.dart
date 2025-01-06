import 'package:book_library/features/book/domain/entities/book_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item_model.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  final String? kind;
  final int? totalItems;
  final List<ItemModel>? items;

  const BookModel({
    this.kind,
    this.totalItems,
    this.items,
  });

  BookEntity toModel() {
    return BookEntity(
      kind: kind ?? '', // kind null ise boş string atıyoruz
      totalItems: totalItems ?? 0, // totalItems null ise 0 değeri veriyoruz
      items: items?.map((e) => e.toModel()).toList() ??
          [], // items listesindeki her öğeyi ItemModel'e dönüştürüyoruz
    );
  }

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
