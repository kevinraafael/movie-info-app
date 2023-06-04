import 'package:cached_network_image/cached_network_image.dart';
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
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 20),
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
                      child: //isImageLoaded[index]?
                          Container(
                        color: Colors.grey[50],
                        child: CachedNetworkImage(
                          memCacheWidth: 294,
                          memCacheHeight: 441,
                          imageUrl:
                              'https://image.tmdb.org/t/p/original/${popularMovies.posterPath}',
                          fit: BoxFit.cover,
                        ),
                      )
                      // : const CircularProgressIndicator(),
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
