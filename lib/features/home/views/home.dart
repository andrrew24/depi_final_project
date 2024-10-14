import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/config/theme/app_color.dart';
import 'package:movie_app/config/constants/app_assets.dart';
import 'package:movie_app/features/home/views/home_view.dart';
import 'package:movie_app/features/search/viewmodels/cubit/search_cubit.dart';
import 'package:movie_app/features/search/views/search_view.dart';
import 'package:movie_app/features/watch_list/views/watch_list_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // List of Navigation Bar widgets

  final List<Widget> views = [
    const HomeView(),
    const SearchView(),
    const WatchListView(),
  ];

  // Function to update the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(),
        )
      ],
      child: Scaffold(
        body: views[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.appBackgroundColor,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.imgHome,
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 0
                        ? AppColor.activeColor
                        : AppColor.lightGreyColor,
                    BlendMode.srcIn),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.imgSearch,
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 1
                        ? AppColor.activeColor
                        : AppColor.lightGreyColor,
                    BlendMode.srcIn),
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.imgSave,
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 2
                        ? AppColor.activeColor
                        : AppColor.lightGreyColor,
                    BlendMode.srcIn),
              ),
              label: "Watch List",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
