import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_library/core/di/locator.dart';
import 'package:book_library/features/auth/login/domain/entity/login_entity.dart';
import 'package:book_library/features/auth/login/domain/usecases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  final LoginUseCase _loginUseCase;

  bool isVisible =true;
  
  LoginCubit(LoginUseCase? loginUseCase) :

  _loginUseCase = loginUseCase ?? getIt<LoginUseCase>(),
   super(LoginInitial());


 Future<void> loginEmailWithPass(LoginEntity loginModel) async {
    emit(LoginLoading());

    final result = await _loginUseCase(loginModel);
    result.fold(
      (failure) => emit(LoginError(errorMessage: failure.message)),
      (user) => emit(LoginDone()),
    );
  }

  void changePasswordObscure() {
    isVisible = !isVisible;
    emit(LoginPasswordObscureChanged(isVisible));
  }
}
