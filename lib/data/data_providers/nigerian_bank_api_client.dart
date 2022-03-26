import 'package:http/http.dart';
import '../models/banks.dart';
import 'base_request.dart';
import 'package:http/http.dart' as http;

import 'constants/api_constant.dart';

class NigerianBankApiClient implements HTTPRequest<List<Banks>> {
  final ApiConstant url;
  final Client client;
  const NigerianBankApiClient({required this.url, required this.client});

  @override
  Future<List<Banks>> execute() async {
    final response = await client.get(Uri.parse(ApiConstant.url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final bankList = banksFromJson(response.body);
      return bankList;
    } else if (response.statusCode == 401) {
      throw http.ClientException("Unauthorized");
    } else if (response.statusCode == 500) {
      throw http.ClientException("Server error");
    } else {
      throw http.ClientException("Oh darn! Something does went wrong");
    }
  }
}
