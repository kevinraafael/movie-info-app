import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconsWidget extends StatelessWidget {
  final String icon;
  final BoxFit? fit;
  final double width;
  final double height;

  const AppIconsWidget({
    super.key,
    required this.icon,
    this.fit,
    this.width = 24,
    this.height = 24,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      fit: fit ?? BoxFit.cover,
      width: width,
      height: height,
    );
  }
}
