import 'package:fixxy_test/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

class CustomThemeProvider extends ChangeNotifier {
  static final customLightTheme = ThemeData(
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    tabBarTheme: const TabBarTheme(
        labelStyle: TextStyle(
      fontFamily: 'Quicksand',
    )),
    fontFamily: 'Quicksand',
    textTheme: const TextTheme(
      /// Medium Heading Black
      headlineMedium: TextStyle(
        // fontSize: 32,
        color: kTextMainColor,
        fontWeight: FontWeight.w600,
        // letterSpacing: -1.2,
        // height: 1.2,
      ),
      //
      /// Small Heading Black
      headlineSmall: TextStyle(
        // fontSize: 24,
        color: kTextMainColor,
        fontWeight: FontWeight.w600,
        // letterSpacing: -0.8,
        // height: 1.2,
      ),

      // /// Green Background Heading White
      // titleLarge: TextStyle(
      //   fontSize: 16,
      //   color: kLightThemeScaffoldBackgroundColor,
      //   fontWeight: FontWeight.w500,
      //   letterSpacing: -0.8,
      //   height: 1.2,
      // ),

      /// Body Large Text
      bodyLarge: TextStyle(
        // fontSize: 14,
        color: kTextMainColor,
        fontWeight: FontWeight.w600,
        // letterSpacing: -0.5,
        // height: 1.2,
      ),

      /// Body Medium Text
      bodyMedium: TextStyle(
        // fontSize: 14,
        color: kTextSecondaryColor,
        fontWeight: FontWeight.w500,
        // letterSpacing: -0.4,
        // height: 1.2,
      ),

      /// Body Medium Text
      bodySmall: TextStyle(
        // fontSize: 14,
        color: kTextSecondaryColor,
        // fontWeight: FontWeight.w500,
        // letterSpacing: -0.4,
        // height: 1.2,
      ),

      /// Button Large Text
      labelLarge: TextStyle(
        // fontSize: 14,
        color: kTextMainColor,
        // fontWeight: FontWeight.w500,
      ),

      /// Button Medium Text
      labelMedium: TextStyle(
        // fontSize: 14,
        color: kTextSecondaryColor,
        // fontWeight: FontWeight.w500,
      ),
    ),
  );
}
