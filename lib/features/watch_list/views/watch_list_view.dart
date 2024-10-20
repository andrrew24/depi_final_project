import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/watch_list/widgets/watchlist_view_body.dart';
import 'package:movie_app/utils/widgets/basic_app_bar.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppBar(
          hasBG: false,
          title: Text(
            "Watch List",
            style: AppStyles.styleMontserratRegular16(),
          ),
        ),
        body: WatchlistViewBody());
  }
}
