



import 'package:book_library/core/error/failure.dart';
import 'package:book_library/features/auth/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase {
  final LoginRepository repository;

  LogoutUseCase(this.repository);

Future<Either<Failure, void>> call()async{
  return await repository.logOut();
}}