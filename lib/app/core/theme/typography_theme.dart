import 'package:flutter/material.dart';

import 'colors_theme.dart';

class TypographyTheme {
  static const String headerFont = 'Montserrat';
  static const String mainFont = 'Poppins';
}

TextStyle headerHomeStyle = const TextStyle(
  fontFamily: TypographyTheme.mainFont,
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

TextStyle categoryHomeStyle = const TextStyle(
  fontFamily: TypographyTheme.mainFont,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: ColorsTheme.bodyTextColor,
);

TextStyle bottomMenuStyle = const TextStyle(
  fontFamily: TypographyTheme.mainFont,
  fontSize: 12,
  fontWeight: FontWeight.w500,
);

TextStyle movieDetailTitleStyle = const TextStyle(
  fontFamily: TypographyTheme.mainFont,
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: ColorsTheme.bodyTextColor,
);

TextStyle movieFeatureStyle = const TextStyle(
  fontFamily: TypographyTheme.headerFont,
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: ColorsTheme.movieFeatureColor,
);
