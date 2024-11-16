import 'package:book_library/core/di/locator.config.dart';
import 'package:book_library/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:book_library/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:book_library/features/home/cubit/home_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()

void configureDependencies() {
  getIt.init(environment: Environment.dev);
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Diğer bağımlılıklarınızı da buraya kaydedin
}

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
abstract class HomeModule{
    @lazySingleton
  HomeCubit get homeCubit;
}