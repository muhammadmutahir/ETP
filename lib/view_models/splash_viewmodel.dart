import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:etp/providers/navigation_provider.dart';

class SplashViewModel with ChangeNotifier {
  final NavigationProvider navigationProvider;
  SplashViewModel(this.navigationProvider);

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 3));

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      navigationProvider.navigateToHome();
    } else {
      navigationProvider.navigateToLogin();
    }
  }
}
