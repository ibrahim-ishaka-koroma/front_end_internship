import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../data/repositories/user_repository.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(() => UserRepository());
    Get.lazyPut<ProfileController>(
      () => ProfileController(repository: Get.find()),
    );
  }
}
