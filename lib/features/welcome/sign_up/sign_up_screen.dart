import 'package:flutter/material.dart';
import 'package:nfc_travel/features/welcome/sign_up/sign_up_view.dart';
import 'package:nfc_travel/res/extensions/string_extensions.dart';
import 'package:nfc_travel/res/utils/app_color.dart';
import 'package:nfc_travel/res/utils/app_style.dart';
import 'package:nfc_travel/res/widgets/app_scaffold.dart';
import 'package:nfc_travel/res/widgets/button/rounded_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listConfig =
        SignUpEnum.values.map((e) => ConfigSignUp.create(type: e)).toList();
    return AppScaffold.welcome(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            BaseRoundedButton.top(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _SignUpHeader(),
                  const SizedBox(
                    height: 60,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return listConfig[index].toUi;
                    },
                    itemCount: listConfig.length,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BaseRoundedButton.all(
                    backgroundColor: AppColor.primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Up'.hardCode,
                          style: AppStyle.IB.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignUpHeader extends StatelessWidget {
  const _SignUpHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 36,
        ),
        Text(
          'Sign Up'.hardCode,
          style: AppStyle.IEB,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Take the next step and sign up to your account'.hardCode,
          style: AppStyle.IR,
        ),
      ],
    );
  }
}
