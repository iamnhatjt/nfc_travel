// ignore_for_file: no_default_cases

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_travel/core/app_router.dart';
import 'package:nfc_travel/gen/assets.gen.dart';
import 'package:nfc_travel/res/extensions/string_extensions.dart';
import 'package:nfc_travel/res/utils/app_color.dart';
import 'package:nfc_travel/res/utils/app_style.dart';
import 'package:nfc_travel/res/utils/navigation_service.dart';

enum WelcomeViewEnum {
  globalGuideAndIcon,
  divider1,
  signUp,
  divider2,
  signIn,
  divider3,
}

extension WelcomeViewExtention on WelcomeViewEnum {
  String get text {
    switch (this) {
      case WelcomeViewEnum.globalGuideAndIcon:
        return 'Global Guide'.hardCode;
      case WelcomeViewEnum.signUp:
        return 'Don’t have an account'.hardCode;
      case WelcomeViewEnum.signIn:
        return 'Already have an account'.hardCode;
      default:
        return '';
    }
  }

  Widget get value {
    switch (this) {
      case WelcomeViewEnum.signUp:
        return GestureDetector(
          onTap: () => currentContext.push(RouterPath.signUp),
          child: Text(
            'Sign Up'.hardCode,
            style: AppStyle.IB.copyWith(color: AppColor.primaryColor),
          ),
        );
      case WelcomeViewEnum.signIn:
        return GestureDetector(
          onTap: () => currentContext.push(RouterPath.signIn),
          child: Text(
            'Sign In'.hardCode,
            style: AppStyle.IB,
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget get toUi {
    if (name.contains('divider')) {
      return Divider(
        color: AppColor.dividerColor.withOpacity(0.6),
        height: 40,
        thickness: 1,
      );
    }
    if (this == WelcomeViewEnum.globalGuideAndIcon) {
      return Column(
        children: [
          const SizedBox(
            height: 36,
          ),
          Text(text, style: AppStyle.IEB),
          const SizedBox(
            height: 15,
          ),
          Assets.icons.locationIcon.image(),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppStyle.IR,
          ),
          value,
        ],
      ),
    );
  }
}
