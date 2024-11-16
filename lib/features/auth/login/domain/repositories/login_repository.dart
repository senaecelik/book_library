

import 'package:book_library/core/error/failure.dart';
import 'package:book_library/features/auth/login/domain/entity/login_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository{

Future<Either<Failure, void>> loginWithEmail(LoginEntity loginModel);
Future<Either<Failure, void>> logOut();

}