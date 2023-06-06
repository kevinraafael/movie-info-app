import 'package:get/get_navigation/get_navigation.dart';

import '../app_module.dart';
import '../modules/home/home_page.dart';
import '../modules/movie_details/movie_details_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: AppModule(),
    ),
    GetPage(
      name: AppRoutes.movieDetails,
      page: () => const MovieDetailsPage(),
      binding: AppModule(),
    )
  ];
}
