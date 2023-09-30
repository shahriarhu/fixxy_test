import 'package:fixxy_test/core/view_models/base_view_model.dart';
import 'package:fixxy_test/ui/views/explore_view.dart';
import 'package:fixxy_test/ui/views/inbox_view.dart';
import 'package:fixxy_test/ui/views/profile_view.dart';
import 'package:fixxy_test/ui/views/trips_view.dart';
import 'package:fixxy_test/ui/views/wishlists_view.dart';

class HomeViewModel extends BaseViewModel {
  /// All the views for bottom navigation bar

  final _screens = [
    const ExploreView(),
    const WishlistsView(),
    const TripsView(),
    const InboxView(),
    const ProfileView(),
  ];

  get screen => _screens[_currentIndex];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
