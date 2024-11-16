part of 'login_cubit.dart';


abstract class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginDone extends LoginState {}
final class LoginError extends LoginState {
  final String errorMessage;

  LoginError({required this.errorMessage});

}


class LoginPasswordObscureChanged extends LoginState {
  final bool isVisible;

   LoginPasswordObscureChanged(this.isVisible);

}
