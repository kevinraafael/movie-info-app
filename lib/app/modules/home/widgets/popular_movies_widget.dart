import 'package:flutter/material.dart';

import '../../../models/movie_model.dart';
import 'counter_movie_widget.dart';

class PopularMoviesWidget extends StatelessWidget {
  final List<MovieModel>? popularMoviesModel;
  const PopularMoviesWidget({
    super.key,
    required this.popularMoviesModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: popularMoviesModel!.length,
        itemBuilder: (context, index) {
          MovieModel popularMovies = popularMoviesModel![index];

          return Container(
            margin: const EdgeInsetsDirectional.only(end: 20),
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/original/${popularMovies.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: CounterMovieWidget(
                    itemNumber: (index + 1).toString(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
