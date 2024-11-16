import 'package:book_library/features/auth/register/data/model/user_model.dart';
import 'package:book_library/features/auth/register/domain/entity/user_entity.dart';

abstract class RegisterRemoteDataSource {
  Future<String> getCurrentUid();

  Future<UserModel?> createUser(UserEntity userEntity);
  Future<void> createUserWithEmailAndPassword(UserEntity userEntity);

}
