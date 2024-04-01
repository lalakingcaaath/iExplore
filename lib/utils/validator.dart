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
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  // TO:DO check if value is less than 8 characters, have one special characters, capitals, and numbers.
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