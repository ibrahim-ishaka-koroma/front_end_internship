import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../data/repositories/user_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(() => UserRepository());
    Get.lazyPut<HomeController>(() => HomeController(repository: Get.find()));
  }
}
