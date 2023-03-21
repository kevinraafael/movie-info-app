import 'package:get/get.dart';

class HomeController extends GetxController {
  int _counter = 0;

  void incrementCounter() {
    _counter++;
    update();
  }

  int get counter => _counter;
}
