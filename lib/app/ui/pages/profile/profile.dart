import 'package:books/app/ui/pages/profile/widgets/circle.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/get_user_information.dart';
import 'widgets/design_date_birth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 98, 129, 127),
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 18.sp),
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: const Color.fromARGB(220, 238, 237, 237),
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -210,
              right: -50,
              child: Circle(
                size: 340,
                colors: const [
                  Colors.pinkAccent,
                  Colors.pink,
                ],
              ),
            ),
            Positioned(
              top: -160,
              left: -60,
              child: Circle(
                size: 240,
                colors: const [
                  Colors.orange,
                  Colors.deepOrangeAccent,
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(212, 190, 186, 186),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40.0)),
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 15.h,
                        ),
                      ),
                    ),
                    BoxDesign(
                      title: 'Nombre',
                      personInfo: UserInfo.name,
                      icon: Icons.notes,
                    ),
                    BoxDesign(
                      title: 'Apellido',
                      personInfo: UserInfo.lastName,
                      icon: Icons.notes,
                    ),
                    BoxDesign(
                      title: 'Número de telefono',
                      personInfo: UserInfo.phoneNumber.toString(),
                      icon: Icons.phone,
                    ),
                    BoxDesign(
                      title: 'Email',
                      personInfo: UserInfo.email,
                      icon: Icons.email,
                    ),
                    const BoxDesignDateBirth(),
                    BoxDesign(
                      title: 'Autor Favorito',
                      personInfo: UserInfo.favoriteAuthor,
                      icon: Icons.person_outline_outlined,
                    ),
                    BoxDesign(
                      title: 'Genero',
                      personInfo: UserInfo.gender,
                      icon: (UserInfo.gender == "Mujer")
                          ? Icons.woman_rounded
                          : (UserInfo.gender == "Hombre")
                              ? Icons.man_outlined
                              : Icons.person_outline_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxDesign extends StatelessWidget {
  const BoxDesign({
    Key? key,
    required this.title,
    required this.personInfo,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String personInfo;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.5.h),
        Row(
          children: [
            SizedBox(
              width: 7.w,
              child: Icon(icon),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 2.w),
          height: 5.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.w),
            border: Border.all(color: Colors.blueAccent),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              personInfo,
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
        ),
      ],
    );
  }
}


