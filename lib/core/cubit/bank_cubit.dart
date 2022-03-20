import 'package:bankode/core/apis/base_request.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../models/banks.dart';
import 'bank_state.dart';

class NigerianBankCubit extends Cubit<NigerianBankState> {
  final HTTPRequest httpRequest;

  NigerianBankCubit(this.httpRequest) : super(NigerianBankLoadingState());
  List<Banks> results = [];

  //This function is called in the initState function to load the bank List before the widget builds.
  Future<void> loadBankList() async {
    try {
      results = await httpRequest.execute();
      emit(NigerianBankLoadedState(results));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  //
  // Future<void> searchBank(query) async {
  //   final result = await httpRequest.execute();
  //   results =
  //       NigerianBankLoadedState(result).bankList.where((bankData) {
  //     final bankName = bankData.name.toLowerCase();
  //     final input = query.toLowerCase();
  //
  //     return bankName.contains(input);
  //   }).toList();
  // }

  //This function is called whenever the text field changes.
  Future<void> runFilter(String enteredKeyword) async {
    if (enteredKeyword.isEmpty) {
      emit(NigerianBankLoadedState(results));
    } else {
      final filteredResult = results.where((bank) => bank.name.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      emit(NigerianBankLoadedState(filteredResult));
    }
  }


}


































