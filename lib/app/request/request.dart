import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class GetRequest {
  var client = http.Client();

  Future getList(Uri url) async {
    Response respuesta = await client.get(url);
    return validarResponse(respuesta);
  }

  dynamic validarResponse(Response response) {
    if (response.statusCode == 200) {
      var result = json.decode(response.body);

      return (result);
    } else {
      return {
        "error": response.statusCode,
        "body": json.decode(response.body),
      };
    }
  }
}
