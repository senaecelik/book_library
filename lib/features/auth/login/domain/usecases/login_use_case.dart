

import 'package:book_library/core/error/failure.dart';
import 'package:book_library/features/auth/login/domain/entity/login_entity.dart';
import 'package:book_library/features/auth/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
final LoginRepository repository;


LoginUseCase(this.repository);


Future<Either<Failure, void>> call(LoginEntity loginModel)async{
  return await repository.loginWithEmail(loginModel);
}

}