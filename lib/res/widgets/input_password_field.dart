import 'package:flutter/material.dart';
import 'package:nfc_travel/res/widgets/input_text_filed.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({required this.controller, super.key, this.hint});
  final TextEditingController controller;
  final String? hint;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return InputTextField(
      hintText: widget.hint,
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
