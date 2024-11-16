import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_library/features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  ForgotPasswordCubit(ForgotPasswordUseCase forgotPasswordUseCase)
      : _forgotPasswordUseCase = forgotPasswordUseCase,
        super(ForgotPasswordInitial());

  Future<void> sendPasswordResetEmail({required String email}) async {
    emit(ForgotPasswordLoading());
    final result = await _forgotPasswordUseCase(email);
    result.fold(
        (failure) => emit(ForgotPasswordError(errorMessage: failure.message)),
        (result) =>
           emit( ForgotPasswordDone(message: "E-mail adresinize gönderildi.")));
  }
}
