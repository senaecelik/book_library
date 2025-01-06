import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;

  const ItemEntity({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
  });

  @override
  List<Object?> get props => [kind, id, etag, selfLink];
}
