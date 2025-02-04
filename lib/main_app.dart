import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'app/app_module.dart';
import 'app/core/config/theme_config.dart';
import 'app/core/enums/flavors.dart';
import 'app/modules/home/home_page.dart';
import 'app/routes/app_pages.dart';

void mainApp(Flavors environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: environment.getEnvironment());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages = true;
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig(context).lightTheme,
      home: const HomePage(),
      getPages: AppPages.pages,
      initialBinding: AppModule(),
    );
  }
}
