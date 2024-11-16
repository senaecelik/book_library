import 'package:auto_route/auto_route.dart';
import 'package:book_library/app/language/locale_keys.g.dart';
import 'package:book_library/app/resources/values_manager.dart';
import 'package:book_library/app/router/app_router.dart';
import 'package:book_library/core/di/locator.dart';
import 'package:book_library/features/auth/register/domain/entity/user_entity.dart';
import 'package:book_library/features/auth/register/domain/usecases/create_user_use_case.dart';
import 'package:book_library/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:book_library/widget/button/outlined_primary_button.dart';
import 'package:book_library/widget/text/message_text_widget.dart';
import 'package:book_library/widget/text/title_widget.dart';
import 'package:book_library/widget/textfield/e_mail_text_field.dart';
import 'package:book_library/widget/textfield/password_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
    final RegisterCubit _registerCubit = RegisterCubit(getIt<CreateUserUseCase>());
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController,
      _emailController,
      _lastNameController,
      _passwordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>.value(
      value: _registerCubit,
      child: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.register_have_an_account.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: () {
                  context.router.popAndPush(
                    const LoginScreenRoute(),
                  );
                },
                child: Text(
                  LocaleKeys.register_login_now.tr(),
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
                  
                  title: LocaleKeys.register_title.tr(),
                ),
                SizedBox(
                  height: AppSizeHeight.s32,
                ),
                SizedBox(
                  height: AppSizeHeight.s16,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Adı"),
                  validator: (value) {
                   return value!.isEmpty ?  "Please not blank": null;
                  },
                  controller: _nameController,
                ),
                SizedBox(
                  height: AppSizeHeight.s16,
                ),
                  TextFormField(
                  decoration: const InputDecoration(labelText: "Soyadı"),
                   validator: (value) {
                   return value!.isEmpty ?  "Please not blank": null;
                  },
                  controller: _lastNameController,
                ),
                 SizedBox(
                  height: AppSizeHeight.s16,
                ),
                EmailTextFormField(emailController: _emailController),
                SizedBox(
                  height: AppSizeHeight.s16,
                ),
                PasswordTextFormField(passwordController: _passwordController),
                SizedBox(
                  height: AppSizeHeight.s16,
                ),
                OutlinedPrimaryButton(
                    child: BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                          state is RegisterDone
                            ? context.router.pushAndPopUntil(
                                const HomeScreenRoute(),
                                predicate: (route) => false,
                              )
                            : null;
                      },
                      builder: (context, state) {
                        return state is RegisterLoading
                            ? const CircularProgressIndicator.adaptive()
                            : Text(LocaleKeys.general_button_register.tr());
                      },
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {

                        UserEntity user = UserEntity(firstName: _nameController.text, 
                        lastName: _lastNameController.text, email: _emailController.text,
                        password: _passwordController.text,
                        );

                        _registerCubit.createUser(user);
                      }
                    }),
                SizedBox(
                  height: AppSizeHeight.s16,
                ),
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return state is RegisterError
                        ? MessageText(message: state.errorMessage,)
                        : const Spacer();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
