import 'package:etp/view_models/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etp/providers/navigation_provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashViewModel(
        Provider.of<NavigationProvider>(context, listen: false),
      ),
      child: Consumer<SplashViewModel>(
        builder: (context, model, child) {
          model.init();

          return Scaffold(
            body: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 250,
                width: 250,
              ),
            ),
          );
        },
      ),
    );
  }
}
