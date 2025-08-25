class Validators {
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    if (!RegExp(r'^\+?[0-9]{7,15}\$').hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) return 'OTP is required';
    if (value.length != 6) return 'OTP must be 6 digits';
    return null;
  }

  static String? validateJson(String? value) {
    if (value == null || value.isEmpty) return 'JSON data is required';
    try {
      final parsed = value.trim();
      if (!parsed.startsWith('{') || !parsed.endsWith('}')) {
        return 'Invalid JSON format';
      }
    } catch (e) {
      return 'Invalid JSON';
    }
    return null;
  }
}
