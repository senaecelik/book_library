import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_library/core/di/locator.dart';
import 'package:book_library/features/auth/register/domain/entity/user_entity.dart';
import 'package:book_library/features/auth/register/domain/usecases/create_user_use_case.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {

  final CreateUserUseCase _createUserUseCase;
  RegisterCubit(CreateUserUseCase? createUserUseCase) : 
  _createUserUseCase = createUserUseCase ?? getIt<CreateUserUseCase>(),
  super(RegisterInitial());

  Future<void> createUser(UserEntity user) async {
    emit(RegisterLoading());

    final result = await _createUserUseCase(user);
    result.fold(
      (failure) => emit(RegisterError(errorMessage: failure.message)),
      (user) => emit(RegisterDone()),
    );
  }
}
