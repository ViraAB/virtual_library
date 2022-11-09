import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../lang/translations.g.dart';
import '../../resources/static_images.dart';
import '../../routes/routes.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 98, 129, 127),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          t.initial_page.information,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              t.initial_page.welcome,
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.h),
            Container(
              width: 30.w,
              color: const Color.fromARGB(255, 87, 151, 204),
              child: TextButton(
                child: Text(
                  t.initial_page.begin,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.datePage,
                  );
                },
              ),
            ),
            const Spacer(),
            Image.asset(
              staticImages.virtualLibrary,
              fit: BoxFit.cover,
              scale: 1,
            ),
          ],
        ),
      ),
    );
  }
}
