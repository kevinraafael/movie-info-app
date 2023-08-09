import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import '../../core/shared/app_icons_widget.dart';
import '../../core/theme/icons_theme.dart';
import 'widgets/movie_poster_image_widget.dart';

import '../../core/config/theme_config.dart';
import '../../core/theme/typography_theme.dart';

import 'movie_details_controller.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  // final MovieModel movie = Get.arguments;
  final _movieDetailController = Get.put(MovieDetailsController());

  @override
  void initState() {
    super.initState();
    _movieDetailController.getMovieInformation();
  }

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
            Obx(
              () => Visibility(
                visible: !_movieDetailController.loader.value,
                replacement: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.height * 0.5,
                  // margin: EdgeInsets.symmetric(
                  //     vertical: MediaQuery.of(context).size.height * 0.3),
                  child: Container(
                      child:
                          RiveAnimation.asset('assets/icons/movie_loader.riv')),
                ),
                child: MoviePosterImageWidget(
                    movie: _movieDetailController.movie.value),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 15,
              ),
              child: Column(
                children: [
                  Obx(
                    () => Visibility(
                      visible: !_movieDetailController.loader.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppIconsWidget(icon: IconsTheme.calendar),
                          Text(
                            _movieDetailController.movieFormatData(
                              _movieDetailController.movie.value.releaseDate,
                            ),
                            style: movieFeatureStyle,
                          ),
                          SizedBox(
                            height: 14,
                            child: VerticalDivider(
                              thickness: 0.75,
                              width: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .movieFeatureColor,
                            ),
                          ),
                          const AppIconsWidget(icon: IconsTheme.clock),
                          Text(
                            '${_movieDetailController.movie.value.runtime?.toString() ?? '?'} minutos',
                            style: movieFeatureStyle,
                          ),
                          SizedBox(
                            height: 14,
                            child: VerticalDivider(
                              thickness: 0.8,
                              width: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .movieFeatureColor,
                            ),
                          ),
                          const AppIconsWidget(icon: IconsTheme.ticket),
                          Text(
                            _movieDetailController
                                    .movie.value.genres?.first.name ??
                                'Não informado',
                            style: movieFeatureStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Obx(
                    () => Visibility(
                      visible: !_movieDetailController.loader.value,
                      child: Text(
                        _movieDetailController.movie.value.overview ?? '',
                        style: bottomMenuStyle.copyWith(
                            color:
                                Theme.of(context).colorScheme.defaultFontColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
