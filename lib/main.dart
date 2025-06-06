import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'app.dart';
// import 'firebase_options.dart';

void main() async {
  // we need to explicitly initialise bindings to get access to the BinaryMessenger
  // This is needed by Crashlytics.
  // https://groups.google.com/forum/#!msg/flutter-announce/sHAL2fBtJ1Y/mGjrKH3dEwAJ
  WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform);
  // } catch (e) {
  //   if (e.toString().contains('duplicate-app')) {
  //     // Firebase already initialized, we can safely ignore this error
  //     debugPrint('Firebase already initialized');
  //   } else {
  //     rethrow; // Rethrow if it's a different error
  //   }
  // }
  // If we run on web, do not use Crashlytics (not supported on web yet)
  if (kIsWeb) {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
    };
    runApp(await getApp(web: true));
  } else {
    // Use dart zone to define Crashlytics as error handler for errors
    // that occur outside runApp
    runZonedGuarded<Future<void>>(() async {
      // ensureInitialized() is idempotent, but we get a warning if it's not called in the same zone as runApp()
      WidgetsFlutterBinding.ensureInitialized();
      // Pass all uncaught errors from the framework to Crashlytics.
      // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      runApp(await getApp(mock: true));
    }, (error, stack) {
      // FirebaseCrashlytics.instance.recordError(error, stack);
    });
  }
}
