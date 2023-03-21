import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info_app/app/modules/home_binding.dart';
import 'package:movie_info_app/app/modules/home_page.dart';
import 'package:movie_info_app/app/routes/app_pages.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      getPages: AppPages.pages,
      initialBinding: HomeBinding(),
    );
  }
}
