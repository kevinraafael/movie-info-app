import 'package:flutter/material.dart';
import '../../../models/movie_model.dart';

import '../../../core/shared/app_icons_widget.dart';
import '../../../core/theme/typography_theme.dart';

class MovieFeatureWidget extends StatelessWidget {
  final MovieModel movie;
  final String icon;
  const MovieFeatureWidget({
    super.key,
    required this.movie,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppIconsWidget(icon: icon),
        Text(
          movie.runtime?.toString() ?? 'Não informado',
          style: movieFeatureStyle,
        )
      ],
    );
  }
}
