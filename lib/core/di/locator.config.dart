// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:book_library/core/di/locator.dart' as _i664;
import 'package:book_library/features/auth/forgot_password/data/datasource/remote/forgot_password_remote_data_source.dart'
    as _i740;
import 'package:book_library/features/auth/forgot_password/data/datasource/remote/forgot_password_remote_data_source_impl.dart'
    as _i744;
import 'package:book_library/features/auth/forgot_password/data/repositories/forgot_password_repository_impl.dart'
    as _i676;
import 'package:book_library/features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i660;
import 'package:book_library/features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i323;
import 'package:book_library/features/auth/forgot_password/presentation/cubit/forgot_password_cubit.dart'
    as _i1066;
import 'package:book_library/features/auth/login/data/datasource/remote/login_remote_data_source.dart'
    as _i596;
import 'package:book_library/features/auth/login/data/datasource/remote/login_remote_data_source_impl.dart'
    as _i581;
import 'package:book_library/features/auth/login/data/repositories/login_repository_impl.dart'
    as _i941;
import 'package:book_library/features/auth/login/domain/repositories/login_repository.dart'
    as _i684;
import 'package:book_library/features/auth/login/domain/usecases/login_use_case.dart'
    as _i568;
import 'package:book_library/features/auth/login/domain/usecases/logout_use_case.dart'
    as _i746;
import 'package:book_library/features/auth/login/presentation/cubit/login_cubit.dart'
    as _i314;
import 'package:book_library/features/auth/register/data/datasource/remote/register_remote_data_source.dart'
    as _i296;
import 'package:book_library/features/auth/register/data/datasource/remote/register_remote_data_source_impl.dart'
    as _i753;
import 'package:book_library/features/auth/register/data/repositories/register_repository_impl.dart'
    as _i56;
import 'package:book_library/features/auth/register/domain/repositories/register_repository.dart'
    as _i346;
import 'package:book_library/features/auth/register/domain/usecases/create_user_use_case.dart'
    as _i727;
import 'package:book_library/features/auth/register/presentation/cubit/register_cubit.dart'
    as _i449;
import 'package:book_library/features/home/cubit/home_cubit.dart' as _i794;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final loginModule = _$LoginModule(this);
    final registerModule = _$RegisterModule(this);
    final homeModule = _$HomeModule(this);
    final forgotPasswordModule = _$ForgotPasswordModule(this);
    gh.factory<_i596.LoginRemoteDataSource>(
        () => _i581.LoginRemoteDataSourceImpl(gh<_i59.FirebaseAuth>()));
    gh.factory<_i684.LoginRepository>(
        () => _i941.LoginRepositoryImpl(gh<_i596.LoginRemoteDataSource>()));
    gh.factory<_i568.LoginUseCase>(
        () => _i568.LoginUseCase(gh<_i684.LoginRepository>()));
    gh.factory<_i746.LogoutUseCase>(
        () => _i746.LogoutUseCase(gh<_i684.LoginRepository>()));
    gh.factory<_i740.ForgotPasswordRemoteDataSource>(
        () => _i744.ForgotPasswordDataSourceImpl(gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i314.LoginCubit>(() => loginModule.loginCubit);
    gh.factory<_i296.RegisterRemoteDataSource>(
        () => _i753.RegisterRemoteDataSourceImpl(
              gh<_i59.FirebaseAuth>(),
              gh<_i974.FirebaseFirestore>(),
            ));
    gh.lazySingleton<_i449.RegisterCubit>(() => registerModule.registerCubit);
    gh.factory<_i660.ForgotPasswordRepository>(() =>
        _i676.ForgotPasswordRepositoryImpl(
            gh<_i740.ForgotPasswordRemoteDataSource>()));
    gh.lazySingleton<_i794.HomeCubit>(() => homeModule.homeCubit);
    gh.factory<_i346.RegisterRepository>(() =>
        _i56.RegisterRepositoryImpl(gh<_i296.RegisterRemoteDataSource>()));
    gh.factory<_i727.CreateUserUseCase>(
        () => _i727.CreateUserUseCase(gh<_i346.RegisterRepository>()));
    gh.factory<_i323.ForgotPasswordUseCase>(() =>
        _i323.ForgotPasswordUseCase(gh<_i660.ForgotPasswordRepository>()));
    gh.lazySingleton<_i1066.ForgotPasswordCubit>(
        () => forgotPasswordModule.forgotPasswordCubit);
    return this;
  }
}

class _$LoginModule extends _i664.LoginModule {
  _$LoginModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i314.LoginCubit get loginCubit =>
      _i314.LoginCubit(_getIt<_i568.LoginUseCase>());
}

class _$RegisterModule extends _i664.RegisterModule {
  _$RegisterModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i449.RegisterCubit get registerCubit =>
      _i449.RegisterCubit(_getIt<_i727.CreateUserUseCase>());
}

class _$HomeModule extends _i664.HomeModule {
  _$HomeModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i794.HomeCubit get homeCubit =>
      _i794.HomeCubit(_getIt<_i746.LogoutUseCase>());
}

class _$ForgotPasswordModule extends _i664.ForgotPasswordModule {
  _$ForgotPasswordModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i1066.ForgotPasswordCubit get forgotPasswordCubit =>
      _i1066.ForgotPasswordCubit(_getIt<_i323.ForgotPasswordUseCase>());
}
