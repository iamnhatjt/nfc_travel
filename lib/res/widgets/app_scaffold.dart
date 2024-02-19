import 'package:flutter/material.dart';
import 'package:nfc_travel/gen/assets.gen.dart';
import 'package:nfc_travel/res/utils/navigation_service.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.body,
    this.appBar,
    this.background,
    this.resizeToAvoidBottomInset,
  });

  factory AppScaffold.welcome({
    Widget? body,
    PreferredSizeWidget? appBar,
    bool? resizeToAvoidBottomInset,
  }) {
    return AppScaffold(
      appBar: appBar,
      body: Stack(
        children: [
          Assets.images.bgImageFirst.image(
            fit: BoxFit.cover,
            width: MediaQuery.sizeOf(currentContext).width,
          ),
          body ?? const SizedBox.shrink(),
        ],
      ),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }

  final Widget? body;
  final Widget? background;
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage(Assets.images.background.path),
            //   fit: BoxFit.fill,
            // ),
            ),
        child: Padding(
          padding: EdgeInsets.only(
            top: (appBar?.preferredSize.height ?? 0) +
                MediaQuery.of(context).padding.top,
          ),
          child: body,
        ),
      ),
    );
  }
}
