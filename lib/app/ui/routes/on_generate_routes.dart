import 'package:books/app/ui/pages/initial/initial.dart';
import 'package:books/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';

import '../pages/date_page/user_info_page.dart';
import '../pages/home_page/home_page.dart';
import '../pages/profile/profile.dart';

Route getRoutes(RouteSettings settings) {
  final name = settings.name;

  late final Widget page;
  switch (name) {
    case Routes.initialPage:
      page = const InitialPage();
      break;

    case Routes.datePage:
      page = const UserInfoPage();
      break;

    case Routes.homePage:
      page = const HomePage();
      break;
      
    case Routes.profilePage:
      page = const ProfilePage();
      break;

    default:
      page = const Scaffold(
        body: Center(
          child: Text('page not found '),
        ),
      );
  }

  return MaterialPageRoute(
    builder: (_) => page,
  );
}
