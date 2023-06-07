import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/typography_theme.dart';
import '../../../models/genre_model.dart';
import '../home_controller.dart';

class GenreWidget extends StatelessWidget {
  final List<GenreModel>? genres;

  const GenreWidget({
    super.key,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: _homeController.genresMovieList.value.genres?.length,
              itemBuilder: (context, index) {
                final genres = _homeController.genresMovieList.value.genres;
                GenreModel genre = genres![index];

                return Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            _homeController.getMoviesCategory(
                              genreId: genre.id.toString(),
                            );
                          },
                          child: Text(
                            genre.name!,
                            style: categoryHomeStyle,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Obx(
                          () => Visibility(
                            visible: genre.id == genres[index].id &&
                                _homeController.selectedGenreId.value ==
                                    genre.id,
                            replacement: Container(),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: const Divider(
                                thickness: 2.5,
                                height: 1.2,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

final _homeController = Get.put(HomeController());
