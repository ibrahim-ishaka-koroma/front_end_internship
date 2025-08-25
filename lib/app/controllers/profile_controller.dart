import 'package:get/get.dart';
import '../data/repositories/user_repository.dart';
import '../data/models/user_model.dart';

class ProfileController extends GetxController {
  final UserRepository repository;
  ProfileController({required this.repository});

  var isLoading = false.obs;
  var user = Rxn<UserModel>();

  void fetchProfile(String userId) async {
    try {
      isLoading.value = true;
      user.value = await repository.getUserById(userId);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void updateProfile(UserModel updatedUser) async {
    try {
      isLoading.value = true;
      await repository.updateUser(updatedUser);
      user.value = updatedUser;
      Get.snackbar('Success', 'Profile updated');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
