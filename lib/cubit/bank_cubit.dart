import 'package:bankode/data/models/banks.dart';
import 'package:bankode/data/repositories/base_request.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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

  //This function is called whenever the text field changes.
  Future<void> runFilter(String enteredKeyword) async {
    if (enteredKeyword.isEmpty) {
      emit(NigerianBankLoadedState(results));
    } else {
      final filteredResult = results.where((bank) => bank.name.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      emit(NigerianBankLoadedState(filteredResult));
    }
  }
//This static method is called in the initState function and serves as the welcome greeting to the user
  static String userGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

}


































