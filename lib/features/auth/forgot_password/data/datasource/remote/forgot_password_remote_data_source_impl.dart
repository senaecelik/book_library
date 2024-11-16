


import 'package:book_library/features/auth/forgot_password/data/datasource/remote/forgot_password_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgotPasswordRemoteDataSource)
class ForgotPasswordDataSourceImpl extends ForgotPasswordRemoteDataSource{
  final FirebaseAuth firebaseAuth;

  ForgotPasswordDataSourceImpl(this.firebaseAuth);
  @override
  Future<void> forgotPass(String email)async {
try {
  firebaseAuth.sendPasswordResetEmail(email: email);
} catch (e) {
  rethrow;
}

  }
}