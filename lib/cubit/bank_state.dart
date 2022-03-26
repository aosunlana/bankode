import 'package:bankode/data/models/banks.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NigerianBankState extends Equatable {}

class NigerianBankLoadingState extends NigerianBankState {
  @override
  List<Object?> get props => [];
}

class NigerianBankLoadedState extends NigerianBankState {
  final List<Banks> bankList;
  NigerianBankLoadedState(this.bankList);

  @override
  List<Object?> get props => [bankList];
}