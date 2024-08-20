import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:etp/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class OtpViewModel extends ChangeNotifier {
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final String verificationId;

  OtpViewModel(this.verificationId);

  Future<void> verifyOtp(BuildContext context) async {
    final otp = otpControllers.map((e) => e.text).join();

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Provider.of<NavigationProvider>(context, listen: false).navigateToHome();
    } catch (e) {
      print('Error verifying OTP: $e');
      // Handle OTP verification errors here
    }
  }
}
