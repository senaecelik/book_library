




import 'package:book_library/core/error/failure.dart';
import 'package:book_library/features/auth/register/data/model/user_model.dart';
import 'package:book_library/features/auth/register/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<Failure, UserModel>> createUser(UserEntity user);
  Future<Either<Failure, void>> createUserWithEmailAndPassword(UserEntity user);

}