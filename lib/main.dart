import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etp/views/splash_view.dart';
import 'package:etp/providers/navigation_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCXRcmCOi4aclZ33gWwvbbB-iL_xzz-6VU',
      appId: '1:961910279553:android:e418a9a6b762e6e675ec80',
      messagingSenderId: '961910279553',
      projectId: 'entry-test-preparation-17295',
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey:
          Provider.of<NavigationProvider>(context, listen: false).navigatorKey,
      home: const SplashView(),
    );
  }
}
