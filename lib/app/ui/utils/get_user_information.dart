class UserInfo {
  UserInfo._();

  static String name = "";
  static String lastName = "";
  static int phoneNumber = 0;
  static String email = "";
  static DateTime? dateOfBirth;
  static String gender = "";
  static String favoriteAuthor = "";
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

// Future<void> saveUpdateData(
//   name,
//   lastName,
//   phoneNumber,
//   email,
//   favoriteAuthor,
// ) async {
//   SharedPreferences userInfo = await SharedPreferences.getInstance();
//   userInfo.setString("userName", name);
//   userInfo.setString("userLastName", lastName);
//   userInfo.setInt("userPhoneNumber", int.parse(phoneNumber));
//   userInfo.setString("userEmail", email);
//   userInfo.setString("userFavoriteAuthor", favoriteAuthor);
// }
