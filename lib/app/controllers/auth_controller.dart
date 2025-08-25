import 'package:get/get.dart';
import '../data/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  AuthController({required this.repository});

  var isLoading = false.obs;
  var phoneNumber = ''.obs;
  var otpCode = ''.obs;

  Future<void> sendOtp(String phone) async {
    try {
      isLoading.value = true;
      await repository.sendOtp(phone);
      phoneNumber.value = phone;
      Get.toNamed('/otp');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void verifyOtp(String otp) async {
    try {
      isLoading.value = true;
      await repository.verifyOtp(phoneNumber.value, otp);
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
