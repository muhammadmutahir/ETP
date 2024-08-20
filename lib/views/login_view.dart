import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etp/view_models/login_viewmodel.dart';
import 'package:etp/view_models/phone_signin_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    final phoneSignInViewModel = Provider.of<PhoneSignInViewModel>(context);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 378,
                    width: 432,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  const Text(
                    "All books in your palm",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      fontFamily: 'Inter',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "No need to buy different books for \n different exam preparation.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {
                      loginViewModel.signInWithGoogle(context);
                    },
                    icon: Image.asset(
                      'assets/images/google_logo.png',
                      height: 20,
                      width: 20,
                    ),
                    label: const Text(
                      "Continue with Google",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007AFF),
                      minimumSize: const Size(360, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "OR",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 83,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF34C759)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.only(left: 8),
                              child: Image.asset(
                                'assets/images/pakistan_flag.png',
                                height: 33,
                                width: 33,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Icon(Icons.arrow_drop_down_outlined),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 267,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF34C759)),
                        ),
                        child: TextField(
                          controller: phoneSignInViewModel.phoneController,
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Phone Number',
                            hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () =>
                        phoneSignInViewModel.signInWithPhone(context),
                    child: const Text(
                      "Continue with Phone",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007AFF),
                      minimumSize: const Size(360, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (loginViewModel.isLoading || phoneSignInViewModel.isLoading)

            /// Added loading indicator
            Container(
              color: Colors.black.withOpacity(0.5),
              // Semi-transparent background
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
