import 'package:bankode/data/data_providers/data_provider.dart';
import 'package:bankode/data/models/banks.dart';
import 'base_request.dart';

import 'constants/api_constant.dart';

class NigerianBankRepository implements HTTPRequest<List<Banks>> {
  final ApiClient apiClient;
  const NigerianBankRepository({required this.apiClient});

  @override
  Future<List<Banks>> execute() async {
    try {
      final rawResultFromAPI = await apiClient.request(url: ApiConstant.url, method: Method.get);
      final bankList = banksFromJson(rawResultFromAPI);
      return bankList;
    } catch(e) {
      throw Exception(e);
    }
  }
}
