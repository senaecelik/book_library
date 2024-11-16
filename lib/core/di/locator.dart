import 'package:book_library/core/di/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init(environment: Environment.dev);

@module
abstract class RegisterModule {
  
}

@module
abstract class LoginModule {
}