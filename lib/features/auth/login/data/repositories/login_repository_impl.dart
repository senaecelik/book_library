


import 'package:book_library/core/error/failure.dart';
import 'package:book_library/features/auth/login/data/datasource/remote/login_remote_data_source.dart';
import 'package:book_library/features/auth/login/domain/entity/login_entity.dart';
import 'package:book_library/features/auth/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource _dataSource;

  LoginRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, void>> loginWithEmail(LoginEntity loginModel)async {
 try {
      // Kullanıcıyı e-posta ve şifre ile oluştur
      await _dataSource.loginEmailAndPassword(loginModel);

      // Eğer başarıyla tamamlanmışsa "Başarılı" mesajı döndür
      return Right("Başarılı");
    } catch (e) {
      // Hata durumunda Failure döndür
      return Left(Failure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> logOut()async {
     try {
      // Kullanıcıyı e-posta ve şifre ile oluştur
      await _dataSource.logout();

      // Eğer başarıyla tamamlanmışsa "Başarılı" mesajı döndür
      return Right("Başarılı");
    } catch (e) {
      // Hata durumunda Failure döndür
      return Left(Failure(message: e.toString()));
    }
  }  
  
}