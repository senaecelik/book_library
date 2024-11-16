import 'package:auto_route/auto_route.dart';
import 'package:book_library/app/language/locale_keys.g.dart';
import 'package:book_library/app/resources/values_manager.dart';
import 'package:book_library/app/router/app_router.dart';
import 'package:book_library/app/utils/package_info/package_info.dart';
import 'package:book_library/widget/button/filled_primary_button.dart';
import 'package:book_library/widget/button/outlined_primary_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Scaffold(
            bottomNavigationBar: BottomAppBar(
              height: MediaQuery.of(context).size.height * .30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilledPrimaryButton(
                    child: Text(LocaleKeys.general_button_login.tr()),
                    onPressed: () {
                      context.router.push(const LoginScreenRoute());
                    },
                  ),
                  SizedBox(
                    height: AppSizeHeight.s14,
                  ),
                  OutlinedPrimaryButton(
                    child: Text(LocaleKeys.general_button_register.tr()),
                    onPressed: () {
                      context.router.push(const RegisterScreenRoute());
                    },
                  ),
                  SizedBox(
                    height: AppSizeHeight.s14,
                  ),
              
                  SizedBox(
                    height: AppSizeHeight.s14,
                  ),
                  Text("V. ${PackageInfoUtils.getAppVersion()}")
                ],
              ),
            ),
          ),

        ],
      );
  }
}
