import 'package:book_library/core/error/failure.dart';
import 'package:book_library/features/auth/register/data/datasource/remote/register_remote_data_source.dart';
import 'package:book_library/features/auth/register/data/model/user_model.dart';
import 'package:book_library/features/auth/register/domain/entity/user_entity.dart';
import 'package:book_library/features/auth/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRepository)
class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterRemoteDataSource _dataSource;

  RegisterRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, UserModel>> createUser(UserEntity user) async {
    try {
      // Kullanıcı oluşturma işlemi
      final UserModel? userModel = await _dataSource.createUser(user);

      // Null kontrolü: Eğer null ise bir Failure döndür
      if (userModel == null) {
        return Left(Failure(message: "Failed to create user."));
      }

      // Kullanıcı başarıyla oluşturulduysa Right döndür
      return Right(userModel);
    } catch (e) {
      // Hata durumunda Failure döndür
      return Left(Failure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, String>> createUserWithEmailAndPassword(UserEntity user) async {
    try {
      _dataSource.createUserWithEmailAndPassword(user);
      return Right("başarılı");
    } catch (e) {
            return Left(Failure(message: e.toString()));

    }
  }
  
}
