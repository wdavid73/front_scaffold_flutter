import 'package:flutter/material.dart';
import 'package:front_scaffold_flutter/routes/app_routes.dart';

class NavigationManager {
  static go(
    BuildContext context,
    String routeName, {
    String transition = 'fadeIn',
    dynamic data,
  }) {
    return Navigator.push(
      context,
      pageRouteBuilder(
        routeName: routeName,
        transition: transition,
        data: data,
      ),
    );
  }

  static void goAndRemove(
    BuildContext context,
    String routeName, {
    String transition = 'fadeIn',
    dynamic data,
  }) {
    Navigator.pushAndRemoveUntil(
      context,
      pageRouteBuilder(
          routeName: routeName, transition: transition, data: data),
      (_) => false,
    );
  }

  static void goAndReplace(
    BuildContext context,
    String routeName, {
    String transition = 'fadeIn',
    dynamic data,
  }) {
    Navigator.pushReplacement(
      context,
      pageRouteBuilder(routeName: routeName, transition: transition),
    );
  }

  static void backAndGo(BuildContext context, String routeName) {
    Navigator.popAndPushNamed(context, routeName);
  }
}

PageRouteBuilder<dynamic> pageRouteBuilder({
  required String routeName,
  String transition = 'fadeIn',
  dynamic data,
}) {
  return PageRouteBuilder(
    settings: RouteSettings(arguments: data),
    pageBuilder: (context, animation, anotherAnimation) {
      if (appRoutes[routeName] != null) {
        return appRoutes[routeName]!(context);
      }
      return appRoutes['not_found']!(context);
    },
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(microseconds: 2000),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return transitions[transition](animation, child);
    },
  );
}

Map<String, dynamic> get transitions => {
      'fadeIn': (animation, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
      'slide': (animation, child) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
      'slideInvert': (animation, child) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
    };
