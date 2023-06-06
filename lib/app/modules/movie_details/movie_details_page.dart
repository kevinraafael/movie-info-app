import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/config/theme_config.dart';
import '../../core/theme/typography_theme.dart';
import '../../models/movie_model.dart';

class MovieDetailsPage extends StatelessWidget {
  MovieDetailsPage({
    Key? key,
  }) : super(key: key);

  final MovieModel movie = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.38,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14)),
                    child: CachedNetworkImage(
                      memCacheWidth: MediaQuery.of(context).size.width.toInt(),
                      memCacheHeight: 210,
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              memCacheWidth: 80,
                              memCacheHeight: 120,
                              imageUrl:
                                  'https://image.tmdb.org/t/p/original/${movie.posterPath}',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              movie.title!,
                              overflow: TextOverflow.ellipsis,
                              style: headerHomeStyle.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .defaultFontColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                movie.overview!,
                style: bottomMenuStyle.copyWith(
                    color: Theme.of(context).colorScheme.defaultFontColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
