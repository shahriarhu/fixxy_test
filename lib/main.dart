import 'package:fixxy_test/locator.dart';
import 'package:fixxy_test/ui/route_navigation.dart';
import 'package:fixxy_test/ui/shared/theme_provider.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Architecture MVVM Provider',
      initialRoute: RouteNavigation.home,
      theme: CustomThemeProvider.customLightTheme,
      onGenerateRoute: RouteNavigation.generateRoute,
    );
  }
}
