import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momamia/screen/home111.dart';
import 'package:momamia/screen/Home.dart';
import 'package:momamia/screen/search.dart';
import 'package:momamia/screen/setting_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: [Home(), const Search(), const Home111(), const Setting()],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: ('Home'),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.search),
          title: ('Search'),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: ('Home1'),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.settings),
          title: ('Settings'),
        )
      ],
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose th
    );
  }
}
