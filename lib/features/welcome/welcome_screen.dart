import 'package:flutter/material.dart';
import 'package:nfc_travel/features/welcome/welcome_view.dart';
import 'package:nfc_travel/res/widgets/app_scaffold.dart';
import 'package:nfc_travel/res/widgets/button/rounded_button.dart';

class WelComeScreen extends StatelessWidget {
  const WelComeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold.welcome(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.4,
          ),
          Expanded(
            child: BaseRoundedButton.top(
              padding: EdgeInsets.zero,
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return WelcomeViewEnum.values[index].toUi;
                  },
                  itemCount: WelcomeViewEnum.values.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
