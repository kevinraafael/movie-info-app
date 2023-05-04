import 'package:get/get_navigation/get_navigation.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    )
  ];
}
