import 'package:book_library/core/di/locator.config.dart';
import 'package:book_library/features/auth/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:book_library/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:book_library/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:book_library/features/book/data/datasource/remote/find_book_api_data_source.dart';
import 'package:book_library/features/home/cubit/home_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  // Register Dio
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.init(environment: Environment.dev);
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  // Diğer bağımlılıklarınızı da buraya kaydedin
}

// // Global olarak FirebaseAuth ve FirebaseFirestore kaydedilebilir
// @module
// abstract class FirebaseModule {
//   @lazySingleton
//   FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

//   @lazySingleton
//   FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
// }

@module
abstract class RegisterModule {
  @lazySingleton
  RegisterCubit get registerCubit;
}

@module
abstract class LoginModule {
  @lazySingleton
  LoginCubit get loginCubit;

}

@module
abstract class HomeModule {
  @lazySingleton
  HomeCubit get homeCubit;
}

@module
abstract class ForgotPasswordModule {
  @lazySingleton
  ForgotPasswordCubit get forgotPasswordCubit;
}


@module
abstract class ApiModule {
  @lazySingleton
  FindBookApiDataSource get findBookApiDataSource => FindBookApiDataSource(GetIt.I<Dio>());
}
