import 'package:get/get.dart';
import '../data/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  AuthController({required this.repository});

  // Reactive variables
  var isLoading = false.obs;
  var phoneNumber = ''.obs;
  var otpCode = ''.obs;

  /// Sends OTP to the given phone number
  Future<void> sendOtp(String phone) async {
    if (phone.isEmpty) {
      Get.snackbar('Error', 'Phone number cannot be empty');
      return;
    }

    try {
      isLoading.value = true;
      await repository.sendOtp(phone);
      phoneNumber.value = phone;
      Get.toNamed('/otp'); // navigate to OTP screen
    } catch (e) {
      Get.snackbar('Error', _parseError(e));
    } finally {
      isLoading.value = false;
    }
  }

  /// Verifies the OTP stored in otpCode
  Future<void> verifyOtp() async {
    final otp = otpCode.value.trim();

    if (otp.isEmpty) {
      Get.snackbar('Error', 'OTP cannot be empty');
      return;
    }

    try {
      isLoading.value = true;
      await repository.verifyOtp(phoneNumber.value, otp);
      Get.offAllNamed('/home'); // navigate to home
    } catch (e) {
      Get.snackbar('Error', _parseError(e));
    } finally {
      isLoading.value = false;
    }
  }

  /// Optional helper to parse errors into user-friendly messages
  String _parseError(dynamic e) {
    // Customize this based on your repository exceptions
    if (e is String) return e;
    return 'Something went wrong. Please try again.';
  }
}
