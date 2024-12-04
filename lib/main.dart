import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tt33/bloc/moods_bloc.dart';
import 'package:tt33/navigation/routes.dart';
import 'package:tt33/pages/home_page.dart';
import 'package:tt33/pages/onboarding_page.dart';
import 'package:tt33/pages/privacy_page.dart';
import 'package:tt33/pages/splash_page.dart';
import 'package:tt33/remote_config.dart';
import 'package:tt33/storages/isar.dart';
import 'package:tt33/storages/shared_preferences.dart';
import 'package:tt33/ui_kit/colors.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await RemoteConfigService.init();
  await AppSharedPreferences.init();
  await AppIsarDatabase.init();

  final isFirstRun = AppSharedPreferences.getIsFirstRun() ?? true;
  if (isFirstRun) await AppSharedPreferences.setNotFirstRun();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    AppInfo(
      data: await AppInfoData.get(),
      child: MyApp(isFirstRun: isFirstRun),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirstRun});

  final bool isFirstRun;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoodsBloc(),
      child: _AppWidget(isFirstRun: isFirstRun),
    );
  }
}

class _AppWidget extends StatelessWidget {
  const _AppWidget({required this.isFirstRun});

  final bool isFirstRun;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<MoodsBloc>().getMoods(),
      builder: (context, snapshot) => MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.background,
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
            color: AppColors.background,
            surfaceTintColor: AppColors.background,
            titleSpacing: 16,
            toolbarHeight: 44,
          ),
        ),
        onUnknownRoute: (settings) => CupertinoPageRoute(
          builder: (context) => const HomePage(),
        ),
        onGenerateRoute: (settings) => switch (settings.name) {
          AppRoutes.onBoarding => CupertinoPageRoute(
              settings: settings,
              builder: (context) => const OnBoardingPage(),
            ),
          AppRoutes.home => CupertinoPageRoute(
              settings: settings,
              builder: (context) => const HomePage(),
            ),
          AppRoutes.privacy => CupertinoPageRoute(
              settings: settings,
              builder: (context) => const PrivacyPage(),
            ),
          _ => null,
        },
        home: SplashPage(isFirstRun: !isFirstRun),
      ),
    );
  }
}
