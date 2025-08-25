// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_otp_rest_starter/app/controllers/auth_controller.dart';
import 'package:flutter_otp_rest_starter/app/data/repositories/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late AuthController authController;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    authController = AuthController(repository: mockAuthRepository);
  });

  test('sendOtp calls AuthRepository.sendOtp', () async {
    when(mockAuthRepository.sendOtp('+123456789')).thenAnswer((_) async {});
    await authController.sendOtp(
      '+123456789',
    ); // Ensure sendOtp returns Future<void>
    verify(mockAuthRepository.sendOtp('+123456789')).called(1);
  });

  test('verifyOtp calls AuthRepository.verifyOtp', () async {
    when(
      mockAuthRepository.verifyOtp('verificationId', '123456'),
    ).thenAnswer((_) async {});
    authController.verifyOtp(
      '123456',
    ); // Adjusted to only pass the verification code
    verify(mockAuthRepository.verifyOtp('verificationId', '123456')).called(1);
  });
}
