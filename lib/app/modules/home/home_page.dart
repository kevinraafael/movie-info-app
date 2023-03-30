import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/typography_theme.dart';
import '../../models/movie_model.dart';
import '../../core/config/theme_config.dart';
import '../../repositories/movies/movies_repository.dart';


import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  final _homeController = Get.put(HomeController());
  var movieModel = MovieModel();
  test() async {
    final MoviesRepository moviesRepository = Get.find();
    movieModel = await moviesRepository.getMovie({});
    movieModel;
  }

  @override
  Widget build(BuildContext context) {
    test();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'O que você deseja assistir? ',
          style: headerHomeStyle.copyWith(),
        ),
      ),
      /*  bottomSheet: Container(
        color: Theme.of(context).colorScheme.primaryColor,
        child: const Divider(
          thickness: 1,
        ),
      ), */
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
            )
          ],
        ),
        /*  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Tela em construção',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Obx(() => Text(
                    '${_homeController.counter.value}',
                  )),
            ],
          ),
        ), */
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: _homeController.incrementCounter, //_incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */
    );
  }
}
