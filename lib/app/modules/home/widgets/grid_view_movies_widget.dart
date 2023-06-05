import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/movie_model.dart';

class GridViewMoviesWidget extends StatelessWidget {
  final List<MovieModel> movies;
  const GridViewMoviesWidget({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 13,
        mainAxisSpacing: 18,
        childAspectRatio: 0.9,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movies.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        MovieModel movie = movies[index];
        return Container(
          margin: const EdgeInsetsDirectional.only(end: 20),
          child: SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                  memCacheWidth: 237,
                  memCacheHeight: 292,
                  imageUrl:
                      'https://image.tmdb.org/t/p/original/${movie.posterPath}',
                  fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}
