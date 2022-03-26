import 'package:bankode/data/models/banks.dart';
import 'package:bankode/presentation/screens/bank_view/bank_view.dart';
import 'package:bankode/presentation/screens/entry_view.dart';
import 'package:bankode/presentation/screens/home_view.dart';
import 'package:bankode/presentation/screens/onboarding.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String entryView = '/';
  static const String onboardingView = '/onboarding';
  static const String homeView = '/home';
  static const String randomView = '/random';
  static const String bankInfo = '/bankInfo';

  RouteGenerator._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case entryView:
        return MaterialPageRoute(
          builder: (_) => const EntryView(),
        );
      case homeView:
        final nickName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => HomeView(nickName: nickName),
        );
      case bankInfo:
        final bank = settings.arguments as Banks;
        return MaterialPageRoute(
          builder: (_) => BankInfo(bank: bank,),
        );
      case onboardingView:
        return MaterialPageRoute(
          builder: (_) => const Onboarding(),
        );
      default:
        throw const FormatException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
