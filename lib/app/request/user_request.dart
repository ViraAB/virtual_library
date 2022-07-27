import 'package:books/app/request/request.dart';

class BookRequest extends GetRequest {
  Future getBookList(Uri url) async {
    final response = await getList(url);

    return response;
  }
}
