import 'dart:developer';

import 'package:val/app/authtication_bloc/authentication_bloc.dart';
import 'package:val/data/repository_impl/authentication_repository_impl.dart';
import 'package:val/domain/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/app/app_prefs.dart';
import 'package:val/app/dependency_injection.dart';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:val/presentation/resources/routes_manager.dart';
import 'package:val/presentation/resources/theme_manager.dart';
import 'package:val/presentation/welcome_screen/view/welcome_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static final _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appPrefs = getIt<AppPreferences>();
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(427, 927),
        builder: (context, child) {
          return BlocProvider(
            create: (context) {
              return registerAuthBloc();
            },
            child: MaterialApp(
              navigatorKey: _navigatorKey,

              initialRoute: Routes.welcomeRoute,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.getRoute,
              theme: getApplicationTheme(),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
            ),
          );
        });
  }
}
