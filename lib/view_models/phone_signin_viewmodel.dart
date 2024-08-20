import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:etp/providers/navigation_provider.dart';

class PhoneSignInViewModel extends ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> signInWithPhone(BuildContext context) async {
    _setLoading(true);
    notifyListeners();

    final FirebaseAuth auth = FirebaseAuth.instance;
    final String phoneNumber = "+92" + phoneController.text.trim();

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        Provider.of<NavigationProvider>(context, listen: false)
            .navigateToHome();
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: ${e.message}');
        _setLoading(false);
        notifyListeners();
      },
      codeSent: (String verificationId, int? resendToken) async {
        Provider.of<NavigationProvider>(context, listen: false)
            .navigateToOtpView(phoneNumber, verificationId);
        _setLoading(false);
        notifyListeners();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _setLoading(false);
        notifyListeners();
      },
    );
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
  }
}
