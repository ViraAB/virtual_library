import 'package:books/app/ui/pages/home_page/cubit/cubit.dart';
import 'package:books/app/ui/pages/home_page/widgets/top_banner.dart';
import 'package:books/app/ui/utils/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../lang/translations.g.dart';

enum SearchOption { book, author }

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String searchByAuthorOrBook = 'Autor';
    TextEditingController _authorOrBookController = TextEditingController();

    return SizedBox(
      height: 8.0.h,
      width: 90.0.w,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.w),
                    bottomLeft: Radius.circular(2.w),
                  ),
                ),
              ),
              value: searchByAuthorOrBook,
              icon: Icon(
                Icons.arrow_drop_down_rounded,
                size: 8.w,
              ),
              onChanged: (String? newValue) {
                searchByAuthorOrBook = newValue!;
              },
              items: <String>[t.home_page.author, t.home_page.book]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            flex: 5,
            child: TextField(
              controller: _authorOrBookController,
              decoration: InputDecoration(
                hintText: "${t.home_page.author}/${t.home_page.book}",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(2.w),
                    bottomRight: Radius.circular(2.w),
                  ),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(2.w),
                    bottomRight: Radius.circular(2.w),
                  ),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                suffixIcon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(3.w),
                      bottomRight: Radius.circular(3.w),
                    ),
                    color: Colors.grey,
                  ),
                  height: double.infinity,
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(
                      Icons.search,
                      size: 8.w,
                    ),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_authorOrBookController.text.isNotEmpty) {
                        final homeCubit = context.read<HomeCubit>();
                        if (searchByAuthorOrBook == "Autor") {
                          homeCubit.loadBooksByAuthor(
                            _authorOrBookController.text,
                          );
                        } else {
                          homeCubit.loadBooksByBook(
                            _authorOrBookController.text,
                          );
                        }
                      } else {
                        context.showTopBanner(
                          Dialog(
                            child: TopBanner(
                              label: t.home_page.error,
                              backgroundColor: Colors.red,
                              isError: true,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
