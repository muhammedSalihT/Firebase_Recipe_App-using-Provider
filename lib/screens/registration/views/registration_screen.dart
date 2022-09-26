import 'package:flutter/material.dart';
import 'package:make_my_dish/constends/colors.dart';
import 'package:make_my_dish/constends/sized_boxes.dart';
import 'package:make_my_dish/routes/routes_manger.dart';
import 'package:make_my_dish/screens/login/views/signin_screen.dart';
import 'package:make_my_dish/screens/registration/controllers/registration_providers.dart';
import 'package:make_my_dish/widgets/app_logo.dart';
import 'package:make_my_dish/widgets/custom_auth_button.dart';
import 'package:make_my_dish/widgets/custom_header.dart';
import 'package:make_my_dish/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registrationProvider = context.read<RegistrationProvider>();
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
              text: "Sign Up",
              onTap: () {
                RoutesManager.removeScreen(screen: const SignInScreen());
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
                        key: registrationProvider.formKey,
                        child: ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          children: [
                            SizedBoxClass.textFieldSizedBox,
                            CustomTextField(
                              validate: ((value) {
                                if (value!.isEmpty) {
                                  return "Enter some thing";
                                } else {
                                  return null;
                                }
                              }),
                              controller: context
                                  .read<RegistrationProvider>()
                                  .userNameController,
                              fieldHeading: "Usename",
                              showContent: false,
                            ),
                            SizedBoxClass.textFieldSizedBox,
                            CustomTextField(
                              validate: ((value) {
                                if (value!.isEmpty) {
                                  return "Enter some thing";
                                } else {
                                  return null;
                                }
                              }),
                              controller: context
                                  .read<RegistrationProvider>()
                                  .emailController,
                              fieldHeading: "Email adress",
                              showContent: false,
                              suffixIcon: const Icon(Icons.visibility_off),
                            ),
                            SizedBoxClass.textFieldSizedBox,
                            CustomTextField(
                              validate: ((value) {
                                if (value == null) {
                                  return "Enter some thing";
                                } else {
                                  return null;
                                }
                              }),
                              controller: context
                                  .read<RegistrationProvider>()
                                  .passwordController,
                              fieldHeading: "Password",
                              showContent: false,
                              suffixIcon: const Icon(Icons.visibility_off),
                            ),
                            SizedBoxClass.textFieldSizedBox,
                            AuthButton(
                                onTap: () {
                                  registrationProvider.validate(context);
                                },
                                text: "Sign Up"),
                            const SizedBox(
                              height: 350,
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
