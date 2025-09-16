import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:islamy/core/localization_app/app_localizations.dart';
import 'package:islamy/core/localization_app/localize_app.dart';
import 'package:islamy/core/prefs/shared_pref_controller.dart';
import 'package:islamy/features/localization/presentation/controllers/localize_controller.dart';

import 'core/di/dependency_injection.dart';
import 'core/routes/app_pages.dart';
import 'core/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefController().initSharedPref();
  await GetStorage.init();
  await DependencyInjection.init();
  // Generate icons class (run this once when you add new icons)
  // await generateIconsClass();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  LocalizeController localizeController =
      Get.put<LocalizeController>(LocalizeController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Islamy',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          locale: localizeController.initialLocale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          translations: LocalizeApp(),
          useInheritedMediaQuery: true,
          fallbackLocale: const Locale('en', 'US'),
        );
      },
    );
  }
}
