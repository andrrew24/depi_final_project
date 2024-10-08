import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/app_color.dart';
import 'package:movie_app/config/theme/app_styles.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.textEditingController,
    this.onSubmit,
  });

  final TextEditingController textEditingController;
  final Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmit,
      controller: textEditingController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          suffixIcon: const Icon(Icons.search_outlined),
          hintText: "Search",
          hintStyle: AppStyles.stylePoppinsRegular14(),
          filled: true,
          fillColor: AppColor.midGreyColor,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20))),
    );
  }
}
