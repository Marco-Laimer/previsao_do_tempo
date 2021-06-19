import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<Map> getData() async {
  Uri url =
      Uri.parse("https://api.hgbrasil.com/weather?key=55b2418b&woeid=455823");

  http.Response response = await http.get(url);

  return jsonDecode(response.body);
}
