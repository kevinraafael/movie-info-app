import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/config/theme_config.dart';

import 'app/modules/home/home_binding.dart';
import 'app/modules/home/home_page.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeConfig(context).lightTheme,
      home: HomePage(),
      getPages: AppPages.pages,
      initialBinding: HomeBinding(),
    );
  }
}
