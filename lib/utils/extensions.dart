extension StringX on String {
  bool containsIgnoreCase(String stringToMatch) {
    return toLowerCase().contains(stringToMatch.toLowerCase());
  }

  bool hasValidData() {
    return this != null && trim().isNotEmpty;
  }

//  bool hasValidEmail() {
//    return hasValidData() && RegExp(emailValidationPattern).hasMatch(this);
//  }

  String getSafeData() {
    return hasValidData() ? this : '';
  }

  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    } else {
      return isEmpty;
    }
  }

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  Iterable<String> toIterable() sync* {
    for (var i = 0; i < length; i++) {
      yield (this[i]);
    }
  }

  /// Same as contains, but allows for case insensitive searching
  ///
  /// [caseInsensitive] defaults to false
  bool containsX(String string, {bool caseInsensitive = false}) {
    if (caseInsensitive) {
      // match even if case doesn't match
      return toLowerCase().contains(string.toLowerCase());
    } else {
      return contains(string);
    }
  }

  String substringUntil(Pattern occurrence) {
    final index = indexOf(occurrence);
    if (index == -1) {
      return this;
    }
    return substring(0, index);
  }

  String toLowerCaseNoSpaces() => toLowerCase().replaceAll(' ', '');
}