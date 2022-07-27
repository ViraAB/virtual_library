// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class BookModel with _$BookModel {
  const factory BookModel({
    required String key,
    required String title,
    required List isbn,

    ///
    @JsonKey(
      name: 'first_publish_year',
    )
        required int firstPublishYear,

    ///
    @JsonKey(
      name: 'author_name',
    )
        required List authorName,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}
