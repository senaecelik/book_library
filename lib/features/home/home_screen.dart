import 'package:auto_route/auto_route.dart';
import 'package:book_library/app/resources/values_manager.dart';
import 'package:book_library/app/router/app_router.dart';
import 'package:book_library/core/di/locator.dart';
import 'package:book_library/features/auth/login/domain/usecases/logout_use_case.dart';
import 'package:book_library/features/home/cubit/home_cubit.dart';
import 'package:book_library/widget/button/outlined_primary_button.dart';
import 'package:book_library/widget/text/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    final HomeCubit homeCubit = HomeCubit(getIt<LogoutUseCase>());


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
homeCubit.close();    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppPadding.pagePadding),
        child: BlocProvider(
          create: (context) => homeCubit,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(child: TitleWidget(title: "Home")),
              BlocListener<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is HomeDone) {
                    context.router.pushAndPopUntil(
                      const SplashScreenRoute(),
                      predicate: (route) => false,
                    );
                  }
                },
                child: OutlinedPrimaryButton(
                    child: const Text("Çıkış yap"), onPressed: () {
                      homeCubit.logout();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
