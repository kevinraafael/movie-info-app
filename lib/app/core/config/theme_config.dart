import 'package:flutter/material.dart';

import '../theme/colors_theme.dart';
import '../theme/typography_theme.dart';

class ThemeConfig {
  ThemeConfig(this.context);
  final BuildContext context;

  ThemeData get lightTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorsTheme.primaryColor,
          elevation: 0,
        ),
        scaffoldBackgroundColor: ColorsTheme.primaryColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: ColorsTheme.bodyTextColor,
          ),
        ),
        primaryTextTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: ColorsTheme.bodyTextColor,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: bottomMenuStyle,
          unselectedLabelStyle: bottomMenuStyle,
          backgroundColor: ColorsTheme.primaryColor,
          unselectedItemColor: ColorsTheme.unselectedItem,
          selectedItemColor: ColorsTheme.selectedItem,
          elevation: 0,
        ),
        dividerTheme: const DividerThemeData(
          color: ColorsTheme.inputBackground,
        ),
      );
}

extension CustomColors on ColorScheme {
  Color get primaryColor =>
      brightness == Brightness.light ? ColorsTheme.primaryColor : Colors.grey;
  Color get inputSearchBackgroundColor => brightness == Brightness.light
      ? ColorsTheme.inputBackground
      : Colors.grey;
  Color get defaultFontColor =>
      brightness == Brightness.light ? ColorsTheme.bodyTextColor : Colors.grey;
}
