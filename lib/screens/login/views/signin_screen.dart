import 'package:flutter/material.dart';
import 'package:make_my_dish/constends/colors.dart';
import 'package:make_my_dish/constends/sized_boxes.dart';
import 'package:make_my_dish/routes/routes_manger.dart';
import 'package:make_my_dish/screens/home/views/home_screen.dart';
import 'package:make_my_dish/screens/login/controllers/signin_provider.dart';
import 'package:make_my_dish/screens/registration/views/registration_screen.dart';
import 'package:make_my_dish/services/auth_provider.dart';
import 'package:make_my_dish/widgets/app_logo.dart';
import 'package:make_my_dish/widgets/custom_auth_button.dart';
import 'package:make_my_dish/widgets/custom_header.dart';
import 'package:make_my_dish/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signinProvider = context.read<SignInProvider>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              color: ColorManager.blue,
            ),
            CustomHeader(
              text: "SignIn",
              onTap: () {
                RoutesManager.removeScreen(screen: const RegistrationScreen());
              },
            ),
            Positioned(
              top: size.height * .1,
              child: Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                  color: ColorManager.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    const AppLogo(),
                    Expanded(
                      child: Form(
                        autovalidateMode: AutovalidateMode.always,
                        child: ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          children: [
                            SizedBoxClass.textFieldSizedBox,
                            CustomTextField(
                              validate: ((value) {
                                if (value == null) {
                                  return "Enter some thing";
                                } else {
                                  null;
                                }
                                return null;
                              }),
                              controller: context
                                  .read<SignInProvider>()
                                  .emailController,
                              fieldHeading: "Email Adress",
                              showContent: false,
                            ),
                            SizedBoxClass.textFieldSizedBox,
                            CustomTextField(
                              validate: ((value) {
                                if (value == null) {
                                  return "Enter some thing";
                                } else {
                                  null;
                                }
                                return null;
                              }),
                              controller: context
                                  .read<SignInProvider>()
                                  .passwordController,
                              fieldHeading: "Password",
                              showContent: false,
                              suffixIcon: const Icon(Icons.visibility_off),
                            ),
                            SizedBoxClass.textFieldSizedBox,
                            AuthButton(
                                onTap: () async {
                                  final message = await AuthService().signIn(
                                      email:
                                          signinProvider.emailController.text,
                                      password: signinProvider
                                          .passwordController.text);
                                  if (message!.contains("success")) {
                                    RoutesManager.removeScreen(
                                        screen: const HomeScreen());
                                  }
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message)));
                                },
                                text: "Sign In"),
                            const SizedBox(
                              height: 400,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
