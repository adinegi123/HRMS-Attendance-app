class FormValidationFunction {
  static const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  static String? checkIfEmpty(String? s) {
    if (s == null || s.isEmpty) {
      return 'Cannot be empty';
    }
    return null;
  }
  static String? checkPassword(String? s, {required bool signUp, required bool login}) {
    if (s == null || s.isEmpty) {
      return 'Cannot be empty';
    }
    if (signUp) {
      if (s.length < 6) {
        return 'Password cannot be less than 6 digits';
      }
      if (!s.contains(RegExp('[^A-Za-z0-9]'))) {
        return 'Please include a special character @!#\$';
      }
    }else if (login) {
      if (s.length < 6) {
        return 'Invalid Password';
      }
    }
    return null;
  }
  static String? checkEmailId(String? s) {
    if (s == null || s.isEmpty) {
      return 'Cannot be empty';
    }
    if (s.contains('@')) {
      if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(s)) {
        return 'Please enter a valid email address';
      }
    }
    if (s.length < 10) {
      return 'Please enter a valid value';
    }
    return null;
  }
}