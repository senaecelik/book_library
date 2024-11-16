// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
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
    gh.factory<_i296.RegisterRemoteDataSource>(
        () => _i753.RegisterRemoteDataSourceImpl(
              gh<_i59.FirebaseAuth>(),
              gh<_i974.FirebaseFirestore>(),
            ));
    gh.factory<_i346.RegisterRepository>(() =>
        _i56.RegisterRepositoryImpl(gh<_i296.RegisterRemoteDataSource>()));
    gh.factory<_i727.CreateUserUseCase>(
        () => _i727.CreateUserUseCase(gh<_i346.RegisterRepository>()));
    return this;
  }
}
