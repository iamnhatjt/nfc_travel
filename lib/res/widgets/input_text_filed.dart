// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_travel/res/utils/app_color.dart';
import 'package:nfc_travel/res/utils/app_style.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    this.onChanged,
    this.focusNode,
    this.obscureText = false,
    this.prefixIcon,
    this.errorText,
    this.textController,
    this.iconButton,
    this.hintText,
    this.maxLine,
    this.label,
    this.enabled = true,
    this.validator,
    this.inputFormatters,
    this.onSaved,
    this.ontap,
    this.textAlign,
    this.decoration,
    this.padding,
    this.maxLength,
  });
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final String? label;
  final String? errorText;
  final bool obscureText;
  final Icon? prefixIcon;
  final String? hintText;
  final TextAlign? textAlign;
  final IconButton? iconButton;
  final int? maxLine;
  final int? maxLength;
  final TextEditingController? textController;
  final bool enabled;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final InputDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      onTap: ontap,
      controller: textController,
      onChanged: onChanged,
      style: AppStyle.IB,
      maxLines: maxLine,
      enabled: enabled,
      textAlign: textAlign ?? TextAlign.start,
      validator: validator,
      maxLength: maxLength,
      onSaved: onSaved,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        // hintStyle: textTheme.t14R.copyWith(color: colorApp.labelSecondary),
        prefixIcon: prefixIcon,
        label: label == null
            ? null
            : Text(
                label ?? '',
              ),
        suffixIcon: iconButton,
        errorText: errorText,
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColor.borderInputColor.withOpacity(0.6)),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColor.borderInputColor.withOpacity(0.6)),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
      ),
    );
  }
}
