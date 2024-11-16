

import 'package:book_library/features/auth/login/domain/entity/login_entity.dart';

abstract class LoginRemoteDataSource {


Future<void> loginEmailAndPassword(LoginEntity loginModel);

Future<void> logout();

}