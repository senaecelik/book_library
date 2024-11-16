import 'package:book_library/features/auth/register/domain/entity/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  UserEntity toEntity() => UserEntity( firstName: firstName, lastName: lastName, email: email,  );

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}