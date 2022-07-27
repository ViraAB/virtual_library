// @dart=2.9

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app/ui/routes/on_generate_routes.dart';
import 'app/ui/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Navigator(
            initialRoute: Routes.initialPage,
            onGenerateRoute: getRoutes,
          ),
        );
      },
    );
  }
}
