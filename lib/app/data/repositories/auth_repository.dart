import '../providers/firebase_provider.dart';

class AuthRepository {
  final FirebaseProvider _firebaseProvider = FirebaseProvider();

  Future<void> sendOtp(String phoneNumber) async {
    await _firebaseProvider.sendOtp(
      phoneNumber,
      (credential) => {}, // Handle auto verification
      (error) => throw error,
      (verificationId, resendToken) => {},
    );
  }

  Future<void> verifyOtp(String verificationId, String smsCode) async {
    await _firebaseProvider.verifyOtp(verificationId, smsCode);
  }

  Future<void> signOut() async {
    await _firebaseProvider.signOut();
  }
}
