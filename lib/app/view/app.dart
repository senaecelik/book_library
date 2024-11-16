import 'package:book_library/app/router/app_router.dart';
import 'package:book_library/app/theme/app_theme_provider.dart';
import 'package:book_library/app/theme/dark/app_dark_theme.dart';
import 'package:book_library/app/theme/light/app_light_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider<AppThemeProvider>(
          create: (_) => AppThemeProvider(),
        ),
      ],
      child: Consumer<AppThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp.router(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              EasyLocalization.of(context)!.delegate,
            ],
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: _appRouter.config(),
            debugShowCheckedModeBanner: false,
            title: 'Sena ÇELİK',
            theme: AppLightTheme().themeData,
            darkTheme: AppDarkTheme().themeData,
            themeMode: value.themeMode,
          );
        },
      ),
    );
  }
}
