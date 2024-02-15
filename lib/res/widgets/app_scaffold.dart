import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.body,
    this.appBar,
    this.background,
    this.resizeToAvoidBottomInset,
  });
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
      body: background ??
          Container(
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
