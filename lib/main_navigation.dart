import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'bloc/main_navigation/main_navigation_bloc.dart';
import 'pages/account.dart';
import 'pages/home.dart';
import 'pages/lettert.dart';
import 'pages/news.dart';
import 'pages/shop.dart';

var iconList = [
  Ionicons.home_outline,
  Ionicons.storefront_outline,
  Ionicons.newspaper_outline,
  Ionicons.person,
];

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainNavigationBloc(),
      child: Scaffold(
        extendBody: true,
        body: ColorfulSafeArea(
          overflowRules: const OverflowRules.only(bottom: true),
          child: BlocBuilder<MainNavigationBloc, MainNavigationState>(
            builder: (context, state) {
              if (state.index == -1) {
                return const Letter();
              } else if (state.index == 1) {
                return Shop();
              } else if (state.index == 2) {
                return News();
              } else if (state.index == 3) {
                return const Account();
              }

              return Home();
            },
          ),
        ),
        floatingActionButton:
            BlocBuilder<MainNavigationBloc, MainNavigationState>(
          builder: (context, state) {
            return FloatingActionButton(
              backgroundColor: Colors.lightGreen,
              onPressed: () {
                context.read<MainNavigationBloc>().add(LetterScreenEvent());
              },
              tooltip: 'Increment',
              child: const Icon(
                Ionicons.document_text_outline,
                color: Colors.white,
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
            BlocBuilder<MainNavigationBloc, MainNavigationState>(
          builder: (context, state) {
            return AnimatedBottomNavigationBar(
              backgroundColor: Colors.white,
              inactiveColor: Colors.lightGreen.shade100,
              activeColor: Colors.lightGreen.shade700,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.verySmoothEdge,
              icons: iconList,
              activeIndex: state.index,
              onTap: (index) {
                if (index == 0) {
                  context.read<MainNavigationBloc>().add(HomeScreenEvent());
                } else if (index == 1) {
                  context.read<MainNavigationBloc>().add(ShopScreenEvent());
                } else if (index == 2) {
                  context.read<MainNavigationBloc>().add(NewsScreenEvent());
                } else if (index == 3) {
                  context.read<MainNavigationBloc>().add(AccountScreenEvent());
                }
              },
            );
          },
        ),
      ),
    );
  }
}
