import 'package:citraland/helper/router_helper.dart';
import 'package:citraland/provider/language_provider.dart';
import 'package:citraland/provider/localization_provider.dart';
import 'package:citraland/provider/theme_provider.dart';
import 'package:citraland/theme/dark_theme.dart';
import 'package:citraland/theme/light_theme.dart';
import 'package:citraland/utill/app_constants.dart';
import 'package:citraland/view/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'di_container.dart' as di;
import 'localization/app_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<LanguageProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<LocalizationProvider>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  static final navigatorKey = new GlobalKey<NavigatorState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences sharedPreferences;
  String initalRoutes;

  @override
  void initState() {
    super.initState();
    RouterHelper.setupRouter();
  }

  @override
  Widget build(BuildContext context) {
    List<Locale> _locals = [];
    AppConstants.languages.forEach((language) {
      _locals.add(Locale(language.languageCode, language.countryCode));
    });

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          // initialRoute: initalRoutes,
          onGenerateRoute: RouterHelper.router.generator,
          home: SplashScreen(),
          title: 'Asthma Monitoring',
          navigatorKey: MyApp.navigatorKey,
          theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
          debugShowCheckedModeBanner: false,
          locale: Provider.of<LocalizationProvider>(context).locale,
          localizationsDelegates: [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: _locals,
        );
      },
    );
  }
}
