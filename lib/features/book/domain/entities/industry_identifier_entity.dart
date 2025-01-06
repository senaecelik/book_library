import 'package:equatable/equatable.dart';

class IndustryIdentifierEntity extends Equatable {
  final String? type;
  final String? identifier;

  const IndustryIdentifierEntity({
    this.type,
    this.identifier,
  });

  @override
  List<Object?> get props => [type, identifier];
}
