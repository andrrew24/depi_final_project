import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/app_color.dart';
import 'package:movie_app/config/theme/app_styles.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key, required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          suffixIcon: Icon(Icons.search_outlined),
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
