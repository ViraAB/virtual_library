const _regExpEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

bool isValidEmail(String text) {
  return RegExp(_regExpEmail).hasMatch(text);
}
