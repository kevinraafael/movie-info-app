import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info_app/app/modules/home/widgets/counter_movie_widget.dart';
import 'package:movie_info_app/app/modules/home/widgets/genre_widget.dart';

import '../../core/config/theme_config.dart';
import '../../core/theme/typography_theme.dart';
import '../../models/movie_model.dart';
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
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: _homeController
                          .popularMoviesList.value.results?.length,
                      itemBuilder: (context, index) {
                        MovieModel popularMovies = _homeController
                            .popularMoviesList.value.results![index];

                        return Container(
                          margin: const EdgeInsetsDirectional.only(end: 20),
                          child: Stack(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
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
                  ),
                ),
              ),
              //Melhorar esse Widget

              Obx(
                () => Visibility(
                  visible: !_homeController.loader.value &&
                      !(_homeController.genresMovieList.value.genres == null),
                  child: GenreWidget(
                    genres: _homeController.genresMovieList.value.genres,
                  ),
                ),
              ),
              /*   Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.20,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount:
                            _homeController.genresMovieList.value.genres?.length,
                        itemBuilder: (context, index) {
                          GenreModel genre = _homeController
                              .genresMovieList.value.genres![index];
                         
                          return Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    genre.name!,
                                    style: categoryHomeStyle,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.20,
                                    child: const Divider(
                                      thickness: 2.5,
                                      height: 1,
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
              ), */

              /*  Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 18,
                  ),
                  itemCount:
                      _homeController.popularMoviesList.value.results!.length,
                  itemBuilder: (context, index) {
                    MovieModel popularMovies =
                        _homeController.popularMoviesList.value.results![index];
      
                    return Container(
                      margin: const EdgeInsetsDirectional.only(end: 20),
                      child: SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w200/${popularMovies.posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ) */
            ],
          ),
        ),
      ),
    );
  }
}
