class PasswordValidator {
  static String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password cannot be empty';
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters';
  } 
  return null;
}

}