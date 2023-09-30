import 'package:fixxy_test/core/services/home_api.dart';
import 'package:fixxy_test/core/view_models/base_view_model.dart';
import 'package:fixxy_test/core/view_models/explore_view_model.dart';
import 'package:fixxy_test/core/view_models/home_view_model.dart';
import 'package:fixxy_test/core/view_models/inbox_view_model.dart';
import 'package:fixxy_test/core/view_models/profile_view_model.dart';
import 'package:fixxy_test/core/view_models/trips_view_model.dart';
import 'package:fixxy_test/core/view_models/wishlists_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => BaseViewModel());

  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => ExploreViewModel());
  locator.registerFactory(() => WishlistsViewModel());
  locator.registerFactory(() => TripsViewModel());
  locator.registerFactory(() => InboxViewModel());
  locator.registerFactory(() => ProfileViewModel());

  locator.registerLazySingleton(() => HomeAPI());
}
