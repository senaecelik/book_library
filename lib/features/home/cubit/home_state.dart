part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeDone extends HomeState {}
final class HomeError extends HomeState {
  final String errorMessage;

  HomeError({required this.errorMessage});
}

