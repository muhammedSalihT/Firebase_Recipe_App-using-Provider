import 'package:flutter/material.dart';
import 'package:make_my_dish/screens/splash/controllers/splash_controller.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    context.read<SplashScreenProvider>().animationController =
        AnimationController(
            duration: const Duration(milliseconds: 2000), vsync: this);

    context.read<SplashScreenProvider>().animation = CurvedAnimation(
        parent: context.read<SplashScreenProvider>().animationController,
        curve: Curves.bounceInOut);
    context.read<SplashScreenProvider>().animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.deepOrange, Colors.yellowAccent]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: context.read<SplashScreenProvider>().animation,
              alignment: Alignment.center,
              child: const Text(
                "Make My Dish",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 40,
                    decoration: TextDecoration.none),
              )),
          if (context.watch<SplashScreenProvider>().isLoading) ...[
            AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                TypewriterAnimatedText('cooking some thing...',
                    textStyle: const TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        color: Colors.white),
                    speed: const Duration(milliseconds: 150)),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
