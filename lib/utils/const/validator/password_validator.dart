class PasswordValidator {
  static String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password cannot be empty';
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters';
  } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter';
  } else if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password must contain at least one lowercase letter';
  } else if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Password must contain at least one number';
  } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
    return 'Password must contain at least one special character (!@#\$&*~)';
  }
  return null;
}

}