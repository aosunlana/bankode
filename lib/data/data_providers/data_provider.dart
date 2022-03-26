import 'package:http/http.dart' as http;
import 'package:http/http.dart';

enum Method { get, post, put, patch, delete }

class ApiClient {
  final Client client;
  ApiClient(this.client);

  Future<dynamic> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? param}) async {
    Response response;
    try {
      if (method == Method.post) {
        response = await client.post(Uri.parse(url), body: param);
      } else if (method == Method.put) {
        response = await client.put(Uri.parse(url), body: param);
      }
      if (method == Method.delete) {
        response = await client.delete(Uri.parse(url), body: param);
      } else if (method == Method.patch) {
        response = await client.patch(Uri.parse(url), body: param);
      } else {
        response = await client.get(Uri.parse(url));
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401) {
        throw http.ClientException("Unauthorized");
      } else if (response.statusCode == 500) {
        throw http.ClientException("Server error");
      } else {
        throw Exception("Oh darn! Something went wrong");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
