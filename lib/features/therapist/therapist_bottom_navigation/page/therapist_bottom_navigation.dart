import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:userapp/features/therapist/home/presentation/pages/therapist_home.dart';
import 'package:userapp/features/therapist/therapist_bottom_navigation/cubit/therapist_bottom_navigation_cubit.dart';
import 'package:userapp/features/therapist/therapist_message/presentation/page/therapist_message_page.dart';
import 'package:userapp/features/therapist/therapist_profile_page/pages/therapist_profile_page.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class TherapistBottomNavigation extends StatelessWidget {
  const TherapistBottomNavigation({super.key});

  List<Widget> _buildScreens() {
    return [
      TherapistHome(),
      TherapistMessagePage(),
      TherapistProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: "Home",
        activeColorPrimary: MyColors.gradientStartColor,
        inactiveColorPrimary: MyColors.hintTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.bell),
        title: "Messages",
        activeColorPrimary: MyColors.gradientStartColor,
        inactiveColorPrimary: MyColors.hintTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: "Offline",
        activeColorPrimary: MyColors.gradientStartColor,
        inactiveColorPrimary: MyColors.hintTextColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TherapistBottomNavigationCubit(),
      child: BlocBuilder<TherapistBottomNavigationCubit, int>(
        builder: (context, selectedIndex) {
          return PersistentTabView(
            context,
            controller: PersistentTabController(initialIndex: selectedIndex),
            screens: _buildScreens(),
            items: _navBarsItems(),
            navBarStyle: NavBarStyle.style12,
            backgroundColor: Theme.of(context).cardColor,
            onItemSelected: (index) => context.read<TherapistBottomNavigationCubit>().changeIndex(index),
          );
        },
      ),
    );
  }
}
