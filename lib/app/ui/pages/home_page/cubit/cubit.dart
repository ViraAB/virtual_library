import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../../models/book/book.dart';
import '../../../../models/details/details_book.dart';
import '../../../../request/user_request.dart';
import 'state/state.dart';

class HomeCubit extends Cubit<LoadBooksState> {
  HomeCubit() : super(LoadBooksState.loading());

  Future<void> loadBooksByAuthor(String nameAuthor) async {
    Uri url;
    List<BookModel> bookList = [];

    url = Uri.https(
      'openlibrary.org',
      '/search.json',
      {
        "fields": "title,author_name,key,first_publish_year,isbn",
        "author": nameAuthor,
        "limit": "20"
      },
    );

    final response = await BookRequest().getBookList(url);
    if (!response.containsKey('error')) {
      for (var i = 0; i < response["docs"].length; i++) {
        bookList.add(BookModel.fromJson(response["docs"][i]));
      }
      emit(Loaded(bookList));
    }
  }

  Future<void> loadBooksByBook(String titleBook) async {
    Uri url;
    List<BookModel> bookList = [];

    url = Uri.https(
      'openlibrary.org',
      '/search.json',
      {
        "fields": "title,author_name,key,first_publish_year,isbn",
        "title": titleBook,
        "limit": "20"
      },
    );

    final response = await BookRequest().getBookList(url);
    if (!response.containsKey('error')) {
      for (var i = 0; i < response["docs"].length; i++) {
        bookList.add(BookModel.fromJson(response["docs"][i]));
      }
      emit(Loaded(bookList));
    }
  }

  Future<BookDetailsModel?> loadBookDetails(String bookKey) async {
    Uri url = Uri.https('openlibrary.org', '$bookKey.json');

    final response = await BookRequest().getBookList(url);
    if (!response.containsKey('error')) {
      return BookDetailsModel.fromJson(response);
    }
    return null;
  }
}
