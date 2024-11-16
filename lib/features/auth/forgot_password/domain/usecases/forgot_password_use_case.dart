

import 'package:book_library/core/error/failure.dart';
import 'package:book_library/features/auth/forgot_password/domain/repositories/forgot_password_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordUseCase {
  final ForgotPasswordRepository repository;

  ForgotPasswordUseCase(this.repository);

Future<Either<Failure, void>> call(String email)async{
  return await repository.forgotPassword(email);
}
}