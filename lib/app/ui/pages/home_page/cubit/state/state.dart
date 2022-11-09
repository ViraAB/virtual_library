import 'package:books/app/models/book/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class LoadBooksState with _$LoadBooksState {
  factory LoadBooksState.loading() = Loading;
  factory LoadBooksState.loaded(
    List<BookModel> listBoks,
  ) = Loaded;
  factory LoadBooksState.error() = Error;
}
