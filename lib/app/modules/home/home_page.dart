import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info_app/app/modules/home/widgets/counter_movie_widget.dart';

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
      body: Padding(
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
                color: Theme.of(context).colorScheme.inputSearchBackgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
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
                visible: !_homeController.loader.value,
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
                    itemCount:
                        _homeController.popularMoviesList.value.results?.length,
                    itemBuilder: (context, index) {
                      MovieModel popularMovies = _homeController
                          .popularMoviesList.value.results![index];

                      return Container(
                        margin: const EdgeInsetsDirectional.only(end: 20),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w200/${popularMovies.posterPath}',
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
            Row(
              children: const [Text('Now Playing')],
            )
          ],
        ),
      ),
    );
  }
}
