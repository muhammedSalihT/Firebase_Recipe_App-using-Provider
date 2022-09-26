import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:make_my_dish/screens/login/views/signin_screen.dart';

import '../../../routes/routes_manger.dart';

class SplashScreenProvider extends ChangeNotifier {
  bool isLoading = false;

  late AnimationController animationController;
  late Animation<double> animation;

  SplashScreenProvider() {
    goToLoginPage();
    Timer(const Duration(seconds: 2), () {
      isLoading = true;
      notifyListeners();
    });
  }

  goToLoginPage() {
    Timer(const Duration(seconds: 6),
        () => RoutesManager.removeScreen(screen: const SignInScreen()));
  }
}
