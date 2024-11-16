import 'package:auto_route/auto_route.dart';
import 'package:book_library/app/language/app_localization.dart';
import 'package:book_library/app/language/locale_keys.g.dart';
import 'package:book_library/app/resources/values_manager.dart';
import 'package:book_library/app/router/app_router.dart';
import 'package:book_library/app/utils/constant/enum/locales.dart';
import 'package:book_library/core/di/locator.dart';
import 'package:book_library/features/auth/login/domain/entity/login_entity.dart';
import 'package:book_library/features/auth/login/domain/usecases/login_use_case.dart';
import 'package:book_library/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:book_library/widget/button/outlined_primary_button.dart';
import 'package:book_library/widget/text/message_text_widget.dart';
import 'package:book_library/widget/text/title_widget.dart';
import 'package:book_library/widget/textfield/e_mail_text_field.dart';
import 'package:book_library/widget/textfield/password_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginCubit loginCubit = LoginCubit(getIt<LoginUseCase>());
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController, _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    loginCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => loginCubit,
      child: Scaffold(
        appBar: AppBar(actions: [
          PopupMenuButton<String>(
            position: PopupMenuPosition.under,
            icon: const Icon(Iconsax.language_circle),
            onSelected: (String value) {
              setState(() {});
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                onTap: () {
                  AppLocalization.updateLanguage(
                      context: context, value: Locales.tr);
                },
                value: '1',
                child: Text(LocaleKeys.general_language_tr.tr()),
              ),
              PopupMenuItem(
                value: '2',
                onTap: () {
                  AppLocalization.updateLanguage(
                      context: context, value: Locales.en);
                },
                child: Text(LocaleKeys.general_language_en.tr()),
              ),
            ],
          )
        ]),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.login_dont_you_have_an_account.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: () {
                  context.router.push(const RegisterScreenRoute());
                },
                child: Text(
                  LocaleKeys.login_register_now.tr(),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(AppPadding.p20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TitleWidget(
                  title: LocaleKeys.login_title.tr(),
                ),
                SizedBox(
                  height: AppSizeHeight.s32,
                ),
                EmailTextFormField(emailController: _emailController),
                SizedBox(
                  height: AppSizeHeight.s12,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return PasswordTextFormField(
                      passwordController: _passwordController,
                      obscureText: loginCubit.isVisible,
                      suffixIcon: IconButton(
                        onPressed: () {
                          loginCubit.changePasswordObscure();
                        },
                        icon: loginCubit.isVisible
                            ? const Icon(Iconsax.eye)
                            : const Icon(Iconsax.eye_slash),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: AppSizeHeight.s6,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          context.router.push(const ForgotPasswordScreenRoute());
                        },
                        child: Text(LocaleKeys.login_forgot_pass.tr()))),
                SizedBox(
                  height: AppSizeHeight.s6,
                ),
                OutlinedPrimaryButton(
                    child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginDone) {
                          context.router.pushAndPopUntil(
                            const HomeScreenRoute(),
                            predicate: (route) => false,
                          );
                        }
                      },
                      builder: (context, state) {
                        return state is LoginLoading
                            ? const CircularProgressIndicator.adaptive()
                            : Text(LocaleKeys.general_button_login.tr());
                      },
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        LoginEntity loginModel = LoginEntity(
                            email: _emailController.text,
                            password: _passwordController.text);
                        loginCubit.loginEmailWithPass(loginModel);
                      }
                    }),
                SizedBox(
                  height: AppSizeHeight.s16,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return state is LoginError
                        ? MessageText(
                            message: state.errorMessage,
                          )
                        : const Spacer();
                  },
                ),
                // SignInGoogleButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
