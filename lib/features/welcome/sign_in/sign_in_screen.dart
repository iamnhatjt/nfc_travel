import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfc_travel/features/welcome/sign_in/sign_in_view.dart';
import 'package:nfc_travel/res/extensions/string_extensions.dart';
import 'package:nfc_travel/res/utils/app_color.dart';
import 'package:nfc_travel/res/utils/app_style.dart';
import 'package:nfc_travel/res/widgets/app_scaffold.dart';
import 'package:nfc_travel/res/widgets/button/rounded_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    final listSignin =
        SignInEnum.values.map((e) => ConfigSignIn.create(type: e)).toList();

    return AppScaffold.welcome(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Positioned(
          bottom: 0,
          child: Column(
            children: [
              const SizedBox(
                height: 300,
              ),
              BaseRoundedButton.top(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Expanded(
                  child: Column(
                    children: [
                      inforLogin(),
                      ListView.builder(
                        itemBuilder: (context, index) => listSignin[index].toUi,
                        itemCount: listSignin.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                      ),
                      Row(
                        children: [
                          StatefulBuilder(
                            builder: (context, setState) => CupertinoCheckbox(
                              activeColor: AppColor.primaryColor,
                              value: isRemember,
                              onChanged: (value) => setState(() {
                                isRemember = value ?? false;
                              }),
                            ),
                          ),
                          Text(
                            'Remember Me'.hardCode,
                            style: AppStyle.IB,
                          ),
                          const Spacer(),
                          Text(
                            'Forgot Password'.hardCode,
                            style: AppStyle.IB,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      BaseRoundedButton.all(
                        onTap: () =>
                            ConfigSignIn.onSignIn(listSignin, isRemember),
                        backgroundColor: AppColor.primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign In'.hardCode,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column inforLogin() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 36,
        ),
        Text(
          'SIGN IN'.hardCode,
          style: AppStyle.IEB,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Enter your details to proceed further'.hardCode,
          style: AppStyle.IR,
        ),
        const SizedBox(
          height: 70,
        ),
      ],
    );
  }
}
