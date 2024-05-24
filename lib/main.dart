import 'package:flutter/material.dart';
import 'package:monkeybox_dhruvi/config.dart';
import 'package:monkeybox_dhruvi/providers/add_exercise_provider.dart';
import 'package:monkeybox_dhruvi/providers/home_provider.dart';
import 'package:monkeybox_dhruvi/routes/index.dart';
import 'package:monkeybox_dhruvi/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/theme/app_theme.dart';
import 'common/theme/theme_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences> snapData) {
          if (snapData.hasData) {
            return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                      create: (_) => ThemeService(snapData.data!,context)),
                  ChangeNotifierProvider(
                      create: (_) => HomeProvider()),
                  ChangeNotifierProvider(
                      create: (_) => AddExerciseProvider()),
                ],
                child: Consumer<ThemeService>(builder: (context, theme, child) {

                  return MaterialApp(
                      title: appFonts.appName,
                      debugShowCheckedModeBanner: false,
                      theme: AppTheme.fromType(ThemeType.light).themeData,
                      darkTheme:
                      AppTheme.fromType(ThemeType.dark).themeData,
                      themeMode: theme.theme,
                      initialRoute: "/",
                      routes: appRoute.route);
                }));
          } else {
            return MaterialApp(
                theme: AppTheme.fromType(ThemeType.light).themeData,
                darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
                themeMode: ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home:  Container());
          }
        });
  }
}
