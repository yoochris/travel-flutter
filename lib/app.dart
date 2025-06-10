import 'package:first_app/ui/pages/entryPoint/entry_point.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/l10n/app_localizations.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:first_app/models/appstate.dart';
import 'package:first_app/ui/pages/home/index.dart';
import 'package:first_app/ui/pages/login/index.dart';
import 'package:first_app/ui/theme/style.dart';

// Using async functions must be done from an async function
Future<Widget> getApp({bool mock = false, bool web = false}) async {
  // var analytics = FirebaseAnalytics.instance;
  // Wrap a StatelessWidget (ProviderApp) in a ChangeNotifierProvider to trigger rebuild of the
  // entire MaterialApp when app state, like locale, changes
  return ChangeNotifierProvider.value(
    value: AppStateModel(
      prefs: await SharedPreferences.getInstance(),
      // analytics: analytics,·
      // messaging: FirebaseMessaging.instance,
      mock: mock,
      web: web,
    ),
    child: ProviderApp(),
  );
}

class ProviderApp extends StatelessWidget {
  // final FirebaseAnalytics analytics;

  const ProviderApp({
    super.key,
    // required this.analytics,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // set to true to see the debug banner
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'travel-flutter',
      navigatorObservers: [
        // FirebaseAnalyticsObserver(analytics: analytics),
      ],
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.watch<AppStateModel>().locale,
      home: const EntryPoint(), // here is entry page
      theme: appTheme,
      routes: <String, WidgetBuilder>{
        "/HomePage": (BuildContext context) => const HomePage(),
        "/LoginPage": (BuildContext context) => const LoginPage(),
      },
    );
  }
}
