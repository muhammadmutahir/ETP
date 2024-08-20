import 'package:etp/view_models/home_view_model.dart';
import 'package:etp/view_models/login_viewmodel.dart';
import 'package:etp/view_models/phone_signin_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etp/view_models/otp_viewmodel.dart';
import 'package:etp/views/home_view.dart';
import 'package:etp/views/login_view.dart';
import 'package:etp/views/otp_view.dart';

class NavigationProvider with ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      navigateToLogin();
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  void navigateToLogin() {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => LoginViewModel()),
            ChangeNotifierProvider(create: (_) => PhoneSignInViewModel()),
          ],
          child: const LoginView(),
        ),
      ),
    );
  }

  void navigateToHome() {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
          child: const HomeView(),
        ),
      ),
    );
  }

  void navigateToOtpView(String phoneNumber, String verificationId) {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => OtpViewModel(verificationId),
          child:
              OtpView(phoneNumber: phoneNumber, verificationId: verificationId),
        ),
      ),
    );
  }
}
