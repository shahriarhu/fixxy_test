import 'package:fixxy_test/ui/views/explore_view.dart';
import 'package:fixxy_test/ui/views/home_view.dart';
import 'package:fixxy_test/ui/views/inbox_view.dart';
import 'package:fixxy_test/ui/views/profile_view.dart';
import 'package:fixxy_test/ui/views/trips_view.dart';
import 'package:fixxy_test/ui/views/wishlists_view.dart';
import 'package:flutter/material.dart';

class RouteNavigation {
  static const String signIn = 'signIn';
  static const String home = 'home';
  static const String explore = 'explore';
  static const String wishlists = 'wishlists';
  static const String trips = 'trips';
  static const String inbox = 'inbox';
  static const String profile = 'profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case signIn:
      //   return MaterialPageRoute(builder: (context) => SignInView());
      case home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case explore:
        return MaterialPageRoute(builder: (context) => const ExploreView());
      case wishlists:
        return MaterialPageRoute(builder: (context) => const WishlistsView());
      case trips:
        return MaterialPageRoute(builder: (context) => const TripsView());
      case inbox:
        return MaterialPageRoute(builder: (context) => const InboxView());
      case profile:
        return MaterialPageRoute(builder: (context) => const ProfileView());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
