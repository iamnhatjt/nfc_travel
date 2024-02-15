import 'package:flutter/material.dart';
import 'package:nfc_travel/core/di.dart';

class NavigationService {
  final navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get navigatorContext => navigatorKey.currentState!.context;
}

BuildContext get currentContext => getIt<NavigationService>().navigatorContext;
