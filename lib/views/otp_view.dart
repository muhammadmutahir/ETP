import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etp/view_models/otp_viewmodel.dart';

class OtpView extends StatelessWidget {
  final String phoneNumber;
  final String verificationId;

  const OtpView(
      {super.key, required this.phoneNumber, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    final otpViewModel = Provider.of<OtpViewModel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Enter OTP sent to $phoneNumber'),
            // OTP input fields
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: otpViewModel.otpControllers.map((controller) {
                return SizedBox(
                  width: 40,
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    maxLength: 1,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => otpViewModel.verifyOtp(context),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
