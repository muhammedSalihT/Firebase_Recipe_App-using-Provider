import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:make_my_dish/routes/routes_manger.dart';
import 'package:make_my_dish/screens/login/controllers/signin_provider.dart';
import 'package:make_my_dish/screens/registration/controllers/registration_providers.dart';
import 'package:make_my_dish/screens/splash/controllers/splash_controller.dart';
import 'package:make_my_dish/screens/splash/views/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegistrationProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: RoutesManager.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
