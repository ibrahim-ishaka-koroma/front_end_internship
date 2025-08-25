import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class OtpView extends StatelessWidget {
  final AuthController _controller = Get.find();
  final TextEditingController otpController = TextEditingController();

  OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: otpController,
              decoration: InputDecoration(labelText: 'OTP'),
            ),
            SizedBox(height: 16),
            Obx(
              () => _controller.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () =>
                          _controller.verifyOtp(otpController.text),
                      child: Text('Verify OTP'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
