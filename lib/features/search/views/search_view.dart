import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/utils/widgets/basic_app_bar.dart';
import 'package:movie_app/utils/widgets/movie_item.dart';
import 'package:movie_app/utils/widgets/textfield_custom.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppBar(
          trailingIcon: Icons.info_outline_rounded,
          hasBG: false,
          title: Text(
            "Search",
            style: AppStyles.styleMontserratRegular16(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Gap(36),
              CustomTextfield(textEditingController: TextEditingController()),
              Gap(24),
              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (context, index) => Gap(10),
                  itemBuilder: (context, index) {
                    return MovieItem();
                  },
                ),
              )
            ],
          ),
        ));
  }
}
