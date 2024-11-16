part of 'forgot_password_cubit.dart';


abstract class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}
final class ForgotPasswordLoading extends ForgotPasswordState {}
final class ForgotPasswordDone extends ForgotPasswordState {
  final String message;

  ForgotPasswordDone({required this.message});
}
final class ForgotPasswordError extends ForgotPasswordState {
  final String errorMessage;

  ForgotPasswordError({required this.errorMessage});
}

