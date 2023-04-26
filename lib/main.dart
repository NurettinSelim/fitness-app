import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/core/routes/router.dart';
import 'package:fitness_app/core/utils/text_config.dart';
import 'package:fitness_app/core/utils/theme_helper.dart';
import 'package:fitness_app/pages/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import 'firebase_options.dart';

void main() async {
  Queue<LogRecord> logs = Queue();

  if (kReleaseMode) {
    // Don't log anything below warnings in production.
    Logger.root.level = Level.WARNING;
  }
  Logger.root.onRecord.listen((record) {
    debugPrint("[${record.level.name}] ${record.loggerName}:"
        " ${record.time}: ${record.message}");

    logs.addLast(record);
    while (logs.length > 100) {
      logs.removeFirst();
    }
  });

  final log = Logger("main");

  WidgetsFlutterBinding.ensureInitialized();
  log.info("WidgetsFlutterBinding.ensureInitialized() called");

  log.info("firebase init start");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  log.info("firebase init success");

  if (kDebugMode) {
    try {
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    } catch (e) {
      log.severe(e);
    }
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp(
      home: SplashScreen(
        nextScreen: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: TextConfig.appName,
          theme: ThemeHelper.themeData,
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
        ),
      ),
    );
  }
}
