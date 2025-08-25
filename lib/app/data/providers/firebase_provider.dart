import 'package:firebase_auth/firebase_auth.dart';

class FirebaseProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendOtp(
    String phoneNumber,
    void Function(PhoneAuthCredential) onVerificationCompleted,
    void Function(FirebaseAuthException) onVerificationFailed,
    void Function(String, int?) onCodeSent,
  ) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: onVerificationCompleted,
      verificationFailed: onVerificationFailed,
      codeSent: onCodeSent,
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<UserCredential> verifyOtp(
    String verificationId,
    String smsCode,
  ) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    return await _auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
