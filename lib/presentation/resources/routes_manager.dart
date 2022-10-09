import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:val/presentation/main/cubit/main_cubit.dart';
import 'package:val/presentation/main/main_screen.dart';
import 'package:val/presentation/main/pages/home/view/home_page.dart';
import 'package:val/presentation/resources/strings_manager.dart';
import 'package:val/presentation/welcome_screen/view/welcome_screen.dart';

class Routes {
  static const String mainRoute = "/main";
  static const String splashRoute = "/splash";
  static const String welcomeRoute = "/welcome";
  static const String submissionsRoute = "/submissions";
  static const String submissionDetailsRoute = "/submissionDetails";
  static const String newFormRoute = "/newFormRoute";
  static const String updateFormRoute = "/updateFormRoute";
  static const String loginRoute = "/login";
}

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => MainCubit(), child: const MainScreen()));
      //
      // case Routes.loginRoute:
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //           create: (context) => LoginBloc(), child: const LoginScreen()));

        case Routes.welcomeRoute:
        return MaterialPageRoute(
            builder: (_) => const WelcomeScreen());

      default:
        return null;
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
