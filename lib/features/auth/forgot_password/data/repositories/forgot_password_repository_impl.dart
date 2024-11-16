

import 'package:book_library/core/error/failure.dart';
import 'package:book_library/features/auth/forgot_password/data/datasource/remote/forgot_password_remote_data_source.dart';
import 'package:book_library/features/auth/forgot_password/domain/repositories/forgot_password_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgotPasswordRepository)
class ForgotPasswordRepositoryImpl extends ForgotPasswordRepository {
  final ForgotPasswordRemoteDataSource _dataSource;

  ForgotPasswordRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    try {
     await _dataSource.forgotPass(email);
           return const Right("Başarılı");

    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}