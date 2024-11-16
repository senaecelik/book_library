




class UserEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String? password;

  UserEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
     this.password,
  });

  String get name => '$firstName $lastName';
}