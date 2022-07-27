import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:url_launcher/url_launcher.dart';

import '../../../../model/details/details_book.dart';

class BookDetails extends StatelessWidget {
  final BookDetailsModel bookDetailsModel;
  final String isbn;

  const BookDetails({
    Key? key,
    required this.bookDetailsModel,
    required this.isbn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List subjectPlacesList = bookDetailsModel.subjectPlaces ?? [];
    List subjectPeopleList = bookDetailsModel.subjectPeople ?? [];
    List subjectTimesList = bookDetailsModel.subjectTimes ?? [];
    final keyBook = bookDetailsModel.key;

    return AlertDialog(
      backgroundColor: const Color.fromARGB(230, 211, 210, 210),
      title: SizedBox(
        height: 80.h,
        width: 90.w,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 3.h),
                  Image.network(
                    "https://covers.openlibrary.org/b/isbn/$isbn-M.jpg",
                    fit: BoxFit.cover,
                    scale: 2,
                  ),
                  SizedBox(height: 2.h),
                  TitleDetails(
                    text: bookDetailsModel.title.toString(),
                    size: 18,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    bookDetailsModel.description ?? "",
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                    ),
                    maxLines: 6,
                  ),
                  SizedBox(height: 2.h),
                  const TitleDetails(text: "Lugares sujetos"),
                  SizedBox(height: 0.5.h),
                  if (subjectPlacesList.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: subjectPlacesList.length,
                      itemBuilder: (BuildContext context, int places) {
                        return Text(
                          "   - ${subjectPlacesList[places]}",
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14,
                          ),
                          maxLines: 6,
                        );
                      },
                    ),
                  SizedBox(height: 2.h),
                  const TitleDetails(text: "Personas sujetas"),
                  SizedBox(height: 0.5.h),
                  if (subjectPeopleList.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: subjectPeopleList.length,
                      itemBuilder: (BuildContext context, int people) {
                        return Text(
                          "   - ${subjectPeopleList[people]}",
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14,
                          ),
                          maxLines: 6,
                        );
                      },
                    ),
                  SizedBox(height: 2.h),
                  const TitleDetails(text: "Tiempos"),
                  SizedBox(height: 0.5.h),
                  if (subjectTimesList.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: subjectTimesList.length,
                      itemBuilder: (BuildContext context, int people) {
                        return Text(
                          "${subjectTimesList[people]}",
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14,
                          ),
                          maxLines: 6,
                        );
                      },
                    ),
                  SizedBox(height: 5.h),
                  InkWell(
                    onTap: () => launch(
                      "https://openlibrary.org$keyBook/isbn_$isbn",
                    ),
                    child: Container(
                      height: 5.h,
                      width: 40.w,
                      color: const Color.fromARGB(255, 87, 151, 204),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Más Información",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: SizedBox(
                height: 25,
                width: 25,
                child: ClipOval(
                  child: Material(
                    shape: const CircleBorder(
                      side: BorderSide(
                        width: 1.3,
                        color: Colors.blue,
                        style: BorderStyle.solid,
                      ),
                    ),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.close,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleDetails extends StatelessWidget {
  const TitleDetails({Key? key, required this.text, this.size})
      : super(key: key);

  final String text;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: size ?? 16,
      ),
    );
  }
}
