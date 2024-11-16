import 'package:book_library/core/error/failure.dart';
import 'package:book_library/features/auth/register/data/model/user_model.dart';
import 'package:book_library/features/auth/register/domain/entity/user_entity.dart';
import 'package:book_library/features/auth/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


@injectable
class CreateUserUseCase {
  final RegisterRepository repository;

  CreateUserUseCase(this.repository);

  Future<Either<Failure, void>> call(UserEntity userEntity) async {
    return await repository.createUserWithEmailAndPassword(userEntity);
  }
}