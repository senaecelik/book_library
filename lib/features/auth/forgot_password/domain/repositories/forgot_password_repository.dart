

import 'package:book_library/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ForgotPasswordRepository {


Future<Either<Failure, String>> forgotPassword(String email);
}