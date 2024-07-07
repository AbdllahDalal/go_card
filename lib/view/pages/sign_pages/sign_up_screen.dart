import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/t_keys.g.dart';
import 'widget/already_have_an_account_widget.dart';
import '../../widget/share_compont/custom_button.dart';
import '../../widget/share_compont/custom_input_field.dart';
import 'widget/page_header.dart';
import 'widget/page_heading.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Constants.kPrimaryColor,
      body: Column(
        children: [
          const PageHeader(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: _theme.colorScheme.background,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  // key: context.read<UserCubit>().signUpFormKey,
                  child: Column(
                    children: [
                      PageHeading(title: LocaleKeys.signUp.tr),

                      //! Name
                      CustomInputField(
                        labelText: LocaleKeys.name.tr,
                        hintText: LocaleKeys.yourname.tr,
                        isDense: true,
                        // controller: context.read<UserCubit>().signUpName,
                      ),
                      const SizedBox(height: 16),
                      //!Email
                      CustomInputField(
                        labelText: LocaleKeys.email.tr,
                        hintText: LocaleKeys.yourEmail.tr,
                        isDense: true,
                        // controller: context.read<UserCubit>().signUpEmail,
                      ),
                      const SizedBox(height: 16),

                      //! Password
                      CustomInputField(
                        labelText: LocaleKeys.password.tr,
                        hintText: LocaleKeys.yourPassword.tr,
                        isDense: true,
                        obscureText: true,
                        suffixIcon: true,
                        // controller: context.read<UserCubit>().signUpPassword,
                      ),
                      //! Confirm Password
                      CustomInputField(
                        labelText: LocaleKeys.confirmPassword.tr,
                        hintText: LocaleKeys.confirmYourPassword.tr,
                        isDense: true,
                        obscureText: true,
                        suffixIcon: true,
                        // controller: context.read<UserCubit>().confirmPassword,
                      ),
                      const SizedBox(height: 22),
                      //!Sign Up Button
                      CustomButton(
                        innerText: LocaleKeys.signUp.tr,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 18),
                      //! Already have an account widget
                      const AlreadyHaveAnAccountWidget(),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
