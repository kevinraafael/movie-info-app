import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../models/movie_model.dart';

import '../../repositories/movies/movies_repository.dart';

class MovieDetailsController extends GetxController {
  final MoviesRepository moviesRepository = Get.find();
  final movie = MovieModel().obs;
  final loader = false.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getMovieInformation();
  }

  void getMovieInformation() async {
    try {
      loader.value = true;
      movie.value = await moviesRepository.getMovieInfo(Get.arguments);
      movie.value;
    } catch (e) {}
    loader.value = false;
  }

  String movieFormatData(String? data) {
    if (data != null) {
      DateTime dateTime = DateTime.parse(data);
      DateFormat dateFormat = DateFormat('yyyy');
      return dateFormat.format(dateTime);
    }
    return 'Não informado';
  }
}
