class TextValidators {
  static String? nameValidator(String? value) {
    final name = value ?? '';
    if (name.isEmpty) return 'This field is required';
    if (name.contains(RegExp(r'[0-9]'))) {
      return 'No numbers allowed';
    }
    return null;
  }

  static String? phoneNumValidator(String? value) {
    if (value == null || value.isEmpty) return null;
    final validPhoneNumber = RegExp(r'^\+(?:[0-9] ?){6,14}[0-9]$');
    if (!validPhoneNumber.hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return null;
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }
}
