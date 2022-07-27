// To parse this JSON data, do
//
//     final bookDetails = bookDetailsFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_book.freezed.dart';
part 'details_book.g.dart';

@freezed
class BookDetailsModel with _$BookDetailsModel {
  const factory BookDetailsModel({
    String? description,
    required String title,
    required String key,

    ///
    @JsonKey(
      name: 'subject_places',
    )
        List? subjectPlaces,

    ///
    @JsonKey(
      name: 'subject_people',
    )
        List? subjectPeople,

    ///
    @JsonKey(
      name: 'subject_times',
    )
        List? subjectTimes,
  }) = _BookDetailsModel;

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BookDetailsModelFromJson(json);
}
