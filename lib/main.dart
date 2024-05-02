import 'dart:async';
import 'dart:developer';

import 'package:attendance_app/Firebase%20methods/firebase_methods.dart';
import 'package:attendance_app/app.dart';
import 'package:attendance_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (!kIsWeb &&
        kDebugMode &&
        defaultTargetPlatform == TargetPlatform.android) {
      await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
    }
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    runApp(MyApp());
  }, (error, stack) async {
    //BD Server
    await FirebaseMethods.sendErrorLog(error: error, stackTrace: stack).then(
        (value) =>
            log('Error: ${error.toString()}', error: error, stackTrace: stack));
    //Firebase
    await FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
