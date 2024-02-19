import 'package:go_router/go_router.dart';
import 'package:nfc_travel/core/di.dart';
import 'package:nfc_travel/features/welcome/welcome_screen.dart';
import 'package:nfc_travel/res/utils/navigation_service.dart';

class RouterPath {
  RouterPath._();
  static String main = '/';
  static String signIn = '/signIn';
  static String signUp = '/signUp';
}

class AppRouter {
  static final List<RouteBase> _listRouter = [
    GoRoute(
      path: RouterPath.main,
      builder: (context, state) => const WelComeScreen(),
    ),
  ];

  static final GoRouter goRouter = GoRouter(
    initialLocation: RouterPath.main,
    routes: _listRouter,
    navigatorKey: getIt<NavigationService>().navigatorKey,
  );
}
