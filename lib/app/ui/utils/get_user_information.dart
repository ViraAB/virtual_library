class UserInfo {
  UserInfo._();

  static String? name;
  static String? lastName;
  static int? phoneNumber;
  static String? email;
  static DateTime? dateOfBirth;
  static Enum? gender;
  static String? favoriteAuthor;
}

void saveUpdateData(
  name,
  lastName,
  phoneNumber,
  email,
  dateOfBirth,
  gender,
  favoriteAuthor,
) {
  UserInfo.name = name;
  UserInfo.lastName = lastName;
  UserInfo.phoneNumber = int.parse(phoneNumber);
  UserInfo.email = email;
  UserInfo.dateOfBirth = dateOfBirth;
  UserInfo.gender = gender;
  UserInfo.favoriteAuthor = favoriteAuthor;
}
