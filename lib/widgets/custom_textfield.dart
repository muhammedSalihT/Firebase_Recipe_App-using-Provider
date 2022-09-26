import 'package:flutter/material.dart';
import 'package:make_my_dish/constends/colors.dart';
import 'package:make_my_dish/constends/text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.fieldHeading,
    required this.controller,
    this.suffixIcon,
    required this.showContent,
     this.validate,
  }) : super(key: key);

  final String fieldHeading;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool showContent;
  final FormFieldValidator<String>? validate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            fieldHeading,
            style: TextStyleManager.textFieldHeading,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: ColorManager.greyLight,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: TextFormField(
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: suffixIcon,
                  hintStyle: TextStyleManager.textFieldHintStyle,
                  hintText: "Text Here...."),
              obscureText: showContent,
              controller: controller,
              validator: validate,
            ),
          ),
        )
      ],
    );
  }
}
