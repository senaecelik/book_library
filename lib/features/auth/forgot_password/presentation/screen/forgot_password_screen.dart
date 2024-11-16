

import 'package:auto_route/auto_route.dart';
import 'package:book_library/app/language/locale_keys.g.dart';
import 'package:book_library/app/resources/values_manager.dart';
import 'package:book_library/core/di/locator.dart';
import 'package:book_library/features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart';
import 'package:book_library/features/auth/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:book_library/widget/button/outlined_primary_button.dart';
import 'package:book_library/widget/text/message_text_widget.dart';
import 'package:book_library/widget/text/title_widget.dart';
import 'package:book_library/widget/textfield/e_mail_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final ForgotPasswordCubit forgotPasswordCubit = ForgotPasswordCubit(getIt<ForgotPasswordUseCase>());
  final _formkey = GlobalKey<FormState>();
  late TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPasswordCubit>.value(
      value: forgotPasswordCubit,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p20, vertical: AppPadding.p30),
          child: Form(
            key: _formkey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Align(
                      alignment: Alignment.centerLeft,
                      child: TitleWidget(title: LocaleKeys.forgot_pass_title.tr())),
                  SizedBox(
                    height: AppSizeHeight.s16,
                  ),
                   Text(
LocaleKeys.forgot_pass_sub_title.tr()),                  SizedBox(
                    height: AppSizeHeight.s32,
                  ),
                  EmailTextFormField(
                    emailController: _emailController,
                  ),
                  SizedBox(
                    height: AppSizeHeight.s32,
                  ),
                  OutlinedPrimaryButton(
                    child:
                        BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                      builder: (context, state) {
                        return state is ForgotPasswordLoading
                            ? const CircularProgressIndicator.adaptive()
                            :  Text(LocaleKeys.forgot_pass_reset_pass.tr());
                      },
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        forgotPasswordCubit.sendPasswordResetEmail(
                            email: _emailController.text);
                       
                      }
                    },
                  ),
                  SizedBox(
                    height: AppSizeHeight.s16,
                  ),
                  BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                    builder: (context, state) {
                      return state is ForgotPasswordDone
                          ? MessageText(message: state.message)
                          : const SizedBox.shrink();
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        context.router.maybePop();
                      },
                      child:  Text(LocaleKeys.general_button_go_back.tr())),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
