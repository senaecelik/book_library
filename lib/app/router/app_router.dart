import 'package:auto_route/auto_route.dart';
import 'package:book_library/features/auth/forgot_password/presentation/screen/forgot_password_screen.dart';
import 'package:book_library/features/auth/login/presentation/screen/login_screen.dart';
import 'package:book_library/features/auth/register/presentation/screen/register_screen.dart';
import 'package:book_library/features/home/home_screen.dart';
import 'package:book_library/features/welcome/splash_screen.dart';
import 'package:book_library/features/welcome/welcome_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen')
final class AppRouter extends RootStackRouter {
  
@override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreenRoute.page, initial: true,),
        AutoRoute(page: WelcomeScreenRoute.page,),
        AutoRoute(page: RegisterScreenRoute.page,),
        AutoRoute(page: LoginScreenRoute.page,),
        AutoRoute(page: HomeScreenRoute.page,),
        AutoRoute(page: ForgotPasswordScreenRoute.page,),



      ];
   @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}
