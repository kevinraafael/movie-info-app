import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CONTADOR',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.normal),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Você apertou X Vezes',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            /*  GetBuilder<HomeController>(
              init: HomeController(), // INIT IT ONLY THE FIRST TIME
              builder: (_) => Text(
                '${_.counter}',
              ),
            ) */
            Obx(() => Text(
                  '${_homeController.counter.value}',
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _homeController.incrementCounter, //_incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
