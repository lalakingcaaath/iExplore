String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  // TO:DO need to validate if value is email
  final RegExp reg = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$");

  if (!reg.hasMatch(value)) {
    return 'Please enter a valid email';
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  // TO:DO check if value is less than 8 characters, have one special characters, capitals, and numbers.\
  // final RegExp reg = RegExp(r'^(?=.*\d)(?=.*[^\w\d\s]).{8,}$');

  // if (!reg.hasMatch(value)) {
  //   return 'Password should be more than 8 characters, one special character, and number';
  // }

  return null;
}

String? validateConfirmPassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}
