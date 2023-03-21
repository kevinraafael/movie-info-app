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
        title: Text('CONTADOR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            GetBuilder<HomeController>(
              init: HomeController(), // INIT IT ONLY THE FIRST TIME
              builder: (_) => Text(
                '${_.counter}',
              ),
            )
            // Obx(() => Text(
            //       _homeController.counter.toString(),
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     )),
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
