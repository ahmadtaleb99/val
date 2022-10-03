import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:val/app/MyApp.dart';
import 'package:val/app/MyBlocObserver.dart';
import 'package:val/app/dependency_injection.dart';

import 'presentation/resources/assets_manager.dart';
import 'presentation/resources/language_manager.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.ensureInitialized();
  await initAppModules();
  // NotificationService().initNotifications();
  runApp(EasyLocalization(
    supportedLocales: const [englishLocale, arabicLocale],
    path: LanguageAssets.languageAssetBase,
    child: MyApp())

  );
}