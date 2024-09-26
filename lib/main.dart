import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:web_portfolio/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

Future<void> main() async {
  //Inicializo lso bindings de flutter
  WidgetsFlutterBinding.ensureInitialized();
  // Inicialzia Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Inicializa Performance Monitoring
  final FirebasePerformance performance = FirebasePerformance.instance;
  await performance.setPerformanceCollectionEnabled(true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // obtengo la instancia de Firebase Analytics
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    return MaterialApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      title: 'SB Portfolio',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
