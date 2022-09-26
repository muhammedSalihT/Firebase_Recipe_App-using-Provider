import 'package:flutter/material.dart';
import 'package:make_my_dish/services/auth_provider.dart';

class RegistrationProvider extends ChangeNotifier {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  AuthService authService = AuthService();

  validate(context) async {
    if (formKey.currentState!.validate()) {
     final msg = await authService.registration(
          email: emailController.text, password: passwordController.text);
          if (msg == "") return disposeMethod(context);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(msg.trim())));
    }else{
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('enter')));
    }
  }
  void disposeMethod(context) {
    emailController.clear();
    passwordController.clear();
    userNameController.clear();
  }
}
