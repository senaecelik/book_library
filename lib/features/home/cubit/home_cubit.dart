import 'package:bloc/bloc.dart';
import 'package:book_library/features/auth/login/domain/usecases/logout_use_case.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

final LogoutUseCase _logoutUseCase;

  HomeCubit(LogoutUseCase logoutUseCase) : _logoutUseCase = logoutUseCase,
  
   super(HomeInitial());


   Future<void> logout()async{
     final result = await _logoutUseCase();
    result.fold(
      (failure) => emit(HomeError(errorMessage: failure.message)),
      (user) => emit(HomeDone()),
    );
   }
}
