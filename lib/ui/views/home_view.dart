import 'package:fixxy_test/core/view_models/home_view_model.dart';
import 'package:fixxy_test/ui/shared/app_colors.dart';
import 'package:fixxy_test/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex,
          onTap: (index) {
            model.currentIndex = index;
          },
          backgroundColor: kScaffoldBackgroundColor,
          selectedItemColor: kMainColor,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: kTextSecondaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              label: 'Wishlists',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trip_origin_rounded),
              label: 'Trips',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
        ),
        body: model.screen,
      ),
    );
  }
}
