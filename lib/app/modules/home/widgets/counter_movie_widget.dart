import 'package:flutter/material.dart';

import '../../../core/theme/colors_theme.dart';

class CounterMovieWidget extends StatelessWidget {
  final String itemNumber;
  const CounterMovieWidget({
    super.key,
    required this.itemNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          itemNumber,
          style: TextStyle(
            fontSize: 96,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1
              ..color = ColorsTheme.highlightedItem,
          ),
        ),
        Text(
          itemNumber,
          style: TextStyle(
            fontSize: 96,
            foreground: Paint()
              ..style = PaintingStyle.fill
              ..strokeWidth = 2.5
              ..color = ColorsTheme.primaryColor,
          ),
        ),
      ],
    );
  }
}
