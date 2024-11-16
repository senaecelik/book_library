import 'package:auto_route/auto_route.dart';
import 'package:book_library/features/auth/register/presentation/screen/register_screen.dart';
import 'package:book_library/features/welcome/splash_screen.dart';
import 'package:book_library/features/welcome/welcome_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen')
final class AppRouter extends RootStackRouter {
  
@override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreenRoute.page, initial: true),
        AutoRoute(page: WelcomeScreenRoute.page,),
        AutoRoute(page: RegisterScreenRoute.page,),





      ];
   List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}
