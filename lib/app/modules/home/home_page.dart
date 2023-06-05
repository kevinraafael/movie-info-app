import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/grid_view_movies_widget.dart';
import '../../models/genre_model.dart';
import 'widgets/popular_movies_widget.dart';

import '../../core/config/theme_config.dart';
import '../../core/theme/typography_theme.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  String imageTest = '';
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'O que você deseja assistir? ',
          style: headerHomeStyle.copyWith(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => _homeController.changePage(value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Procurar",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_rounded,
            ),
            label: 'Lista',
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 17,
                ),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.inputSearchBackgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: TextField()),
                    Icon(
                      Icons.search,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Obx(
                () => Visibility(
                  visible: !_homeController.loader.value &&
                      !(_homeController.popularMoviesList.value.results ==
                          null),
                  replacement: const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  child: PopularMoviesWidget(
                    popularMoviesModel:
                        _homeController.popularMoviesList.value.results,
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: !_homeController.loader.value &&
                      !(_homeController.genresMovieList.value.genres == null),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: _homeController
                                .genresMovieList.value.genres?.length,
                            itemBuilder: (context, index) {
                              final genres =
                                  _homeController.genresMovieList.value.genres;
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
                                      Visibility(
                                        visible: genre.id == genres[index].id,
                                        replacement: Container(),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.20,
                                          child: const Divider(
                                            thickness: 2.5,
                                            height: 1,
                                          ),
                                        ),
                                      ),
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
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Obx(
                  () => Visibility(
                    visible:
                        _homeController.moviesByGenre.value.results != null,
                    child: GridViewMoviesWidget(
                        movies:
                            _homeController.moviesByGenre.value.results ?? []),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
