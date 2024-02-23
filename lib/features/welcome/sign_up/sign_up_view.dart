// ignore_for_file: no_default_cases

import 'package:flutter/material.dart';
import 'package:nfc_travel/res/utils/app_style.dart';
import 'package:nfc_travel/res/widgets/input_password_field.dart';
import 'package:nfc_travel/res/widgets/input_text_filed.dart';

enum SignUpEnum {
  fullName,
  email,
  userName,
  password,
  confirmPassword,
}

extension SignUpExtension on SignUpEnum {
  String get text {
    switch (this) {
      case SignUpEnum.fullName:
        return 'Full name';
      case SignUpEnum.email:
        return 'Email';
      case SignUpEnum.userName:
        return 'Username';
      case SignUpEnum.password:
        return 'Password';
      case SignUpEnum.confirmPassword:
        return 'Confirm password';
    }
  }

  String get hintText {
    switch (this) {
      case SignUpEnum.fullName:
        return 'Enter your full name';
      case SignUpEnum.email:
        return 'Enter your email';
      case SignUpEnum.userName:
        return 'Create your user name';
      case SignUpEnum.password:
        return 'Enter your password';
      case SignUpEnum.confirmPassword:
        return 'Confirm your password';
    }
  }

  IconButton get icon {
    switch (this) {
      case SignUpEnum.fullName:
        return IconButton(
          onPressed: () {},
          icon: const Icon(Icons.people_outline_outlined),
        );
      case SignUpEnum.email:
        return IconButton(
          onPressed: () {},
          icon: const Icon(Icons.email_outlined),
        );
      case SignUpEnum.userName:
        return IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info_outline_rounded),
        );
      case SignUpEnum.password:
        return IconButton(
          onPressed: () {},
          icon: const Icon(Icons.remove_red_eye_outlined),
        );
      case SignUpEnum.confirmPassword:
        return IconButton(
          onPressed: () {},
          icon: const Icon(Icons.remove_red_eye_outlined),
        );
    }
  }

  Widget textField(TextEditingController controller) {
    switch (this) {
      case SignUpEnum.confirmPassword || SignUpEnum.password:
        return PasswordField(
          controller: controller,
          hint: hintText,
        );
      default:
        return InputTextField(
          maxLine: 1,
          textController: controller,
          hintText: hintText,
          iconButton: icon,
        );
    }
  }
}

class ConfigSignUp {
  ConfigSignUp.create({required this.type});
  SignUpEnum type;
  TextEditingController controller = TextEditingController();
  Widget get toUi {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(type.text, style: AppStyle.IM),
        const SizedBox(
          height: 8,
        ),
        type.textField(controller),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
