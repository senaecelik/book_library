


import 'package:book_library/features/auth/login/data/datasource/remote/login_remote_data_source.dart';
import 'package:book_library/features/auth/login/domain/entity/login_entity.dart';
import 'package:book_library/features/auth/register/domain/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
final FirebaseAuth firebaseAuth;

  LoginRemoteDataSourceImpl(this.firebaseAuth);
  @override
  Future<void> loginEmailAndPassword(LoginEntity loginModel)async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: loginModel.email, password: loginModel.password);

      
  } catch (e) {
    rethrow;
  }
}

  @override
  Future<void> logout() async{
    try {
      firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}