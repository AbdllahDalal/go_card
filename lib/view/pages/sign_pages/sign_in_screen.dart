import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/t_keys.g.dart';
import '../../widget/share_compont/custom_button.dart';
import '../../widget/share_compont/custom_input_field.dart';
import 'widget/dont_have_an_account.dart';
import 'widget/page_header.dart';
import 'widget/page_heading.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
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
                  // key: context.read<UserCubit>().signInFormKey,
                  child: Column(
                    children: [
                      PageHeading(title: LocaleKeys.signIn.tr),
                      //!Email
                      CustomInputField(
                        labelText: LocaleKeys.email.tr,
                        hintText: LocaleKeys.yourEmail.tr,
                        // controller: context.read<UserCubit>().signInEmail,
                      ),
                      const SizedBox(height: 16),
                      //!Password
                      CustomInputField(
                        labelText: LocaleKeys.password.tr,
                        hintText: LocaleKeys.yourPassword.tr,
                        obscureText: true,
                        suffixIcon: true,
                        // controller: context.read<UserCubit>().signInPassword,
                      ),
                      const SizedBox(height: 16),
                      //! Forget password?
                      const SizedBox(height: 20),
                      //!Sign In Button
                      CustomButton(
                        innerText: LocaleKeys.signIn.tr,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 18),
                      //! Dont Have An Account ?
                      DontHaveAnAccountWidget(size: size),
                      const SizedBox(height: 20),
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
