import 'package:books/app/ui/pages/home_page/widgets/list_books.dart';
import 'package:books/app/ui/utils/get_user_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../resources/static_images.dart';
import '../../routes/routes.dart';
import 'cubit/cubit.dart';
import 'cubit/state/state.dart';
import 'widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit()..loadBooksByAuthor(UserInfo.favoriteAuthor),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 98, 129, 127),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Biblioteca Virtual",
            style: TextStyle(fontSize: 18.sp),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: IconButton(
                color: Colors.white,
                icon: Icon(
                  Icons.person,
                  size: 7.w,
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.profilePage,
                  );
                },
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: 90.h,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.w, left: 8.w, right: 8.w),
                    child: const Text(
                      "Ingresa el nombre del libro que deseas "
                      "buscar o el nombre del autor:",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  const SearchBar(),
                  SizedBox(height: 4.h),
                  Expanded(
                    flex: 7,
                    child: BlocBuilder<HomeCubit, LoadBooksState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 30.w),
                              child: SizedBox(
                                child: const CircularProgressIndicator(
                                  backgroundColor:
                                      Color.fromARGB(80, 110, 108, 110),
                                  color: Color.fromARGB(255, 81, 148, 202),
                                  strokeWidth: 8.0,
                                ),
                                width: 40.w,
                              ),
                            );
                          },
                          loaded: (books) => ListBooks(listBooks: books),
                          error: () {
                            return Image.asset(
                              staticImages.sadCloud,
                              fit: BoxFit.cover,
                              scale: 1.5,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 2.5.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
