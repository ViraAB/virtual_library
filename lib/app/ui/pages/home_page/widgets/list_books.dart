import 'package:books/app/models/book/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/static_images.dart';
import '../cubit/cubit.dart';
import 'alert_dialog.dart';

class ListBooks extends StatelessWidget {
  final List<BookModel> listBooks;

  const ListBooks({Key? key, required this.listBooks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (listBooks.isNotEmpty)
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: listBooks.length,
            itemBuilder: (BuildContext context, int index) {
              String isbn = listBooks[index].isbn[0];

              return Padding(
                padding: EdgeInsets.all(1.w),
                child: GestureDetector(
                  onTap: () async {
                    final homeCubit = context.read<HomeCubit>();
                    final bookDetailsModel = await homeCubit.loadBookDetails(
                      listBooks[index].key,
                    );
                    await showDialog(
                      context: context,
                      builder: (context) => BookDetails(
                        isbn: listBooks[index].isbn[0],
                        bookDetailsModel: bookDetailsModel!,
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.blueAccent,
                        ),
                      ),
                      child: Image.network(
                        "https://covers.openlibrary.org/b/isbn/"
                        "$isbn-L.jpg?default=false",
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            staticImages.defaultImage,
                            fit: BoxFit.cover,
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: SizedBox(
              width: 60.w,
              height: 50.h,
              child: Column(
                children: [
                  const Text(
                    "Lo sentimos, tu consulta no nos arrojo"
                    " ningún resultado."
                    "\n\nVuelve a intentarlo :D",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Image.asset(
                    staticImages.sadCloud,
                    fit: BoxFit.cover,
                    scale: 1.5,
                  ),
                ],
              ),
            ),
          );
  }
}
