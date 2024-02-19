// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:nfc_travel/res/extensions/string_extensions.dart';
import 'package:nfc_travel/res/utils/app_style.dart';
import 'package:nfc_travel/res/widgets/input_text_filed.dart';

enum SignInEnum {
  email,
  password,
}

extension SignInExtension on SignInEnum {
  String get text {
    switch (this) {
      case SignInEnum.email:
        return 'Enter your email'.hardCode;
      case SignInEnum.password:
        return 'Enter your password'.hardCode;
    }
  }

  Widget textField(TextEditingController controller) {
    switch (this) {
      case SignInEnum.email:
        return InputTextField(
          maxLine: 1,
          textController: controller,
          iconButton: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.email_outlined),
          ),
        );

      case SignInEnum.password:
        return _PasswordField(
          controller: controller,
        );
    }
  }
}

class ConfigSignIn {
  ConfigSignIn.create({required this.type});
  SignInEnum type;
  TextEditingController controller = TextEditingController();

  Widget get toUi {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          type.text,
          style: AppStyle.IM,
        ),
        const SizedBox(
          height: 8,
        ),
        type.textField(controller),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }

  static void onSignIn(List<ConfigSignIn> list, bool isRemember) {}
}

class _PasswordField extends StatefulWidget {
  const _PasswordField({required this.controller});
  final TextEditingController controller;

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return InputTextField(
      obscureText: isShow,
      maxLine: 1,
      textController: widget.controller,
      iconButton: IconButton(
        onPressed: () {
          isShow = !isShow;
          setState(() {});
        },
        icon: isShow
            ? const Icon(Icons.remove_red_eye_outlined)
            : const Icon(Icons.remove_red_eye_rounded),
      ),
    );
  }
}
