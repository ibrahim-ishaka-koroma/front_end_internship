import 'package:get/get.dart';
import '../data/repositories/user_repository.dart';
import '../data/models/user_model.dart';

class HomeController extends GetxController {
  final UserRepository repository;
  HomeController({required this.repository});

  var isLoading = false.obs;
  var users = <UserModel>[].obs;

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      final data = await repository.getUsers(); // should return List<UserModel>
      users.assignAll(data);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
