import 'package:bankode/ui/views/entry/entry_view.dart';
import 'package:bankode/ui/views/home/home_view.dart';
import 'package:bankode/ui/views/info/bank_info_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String entryView = '/';
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
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case bankInfo:
        return MaterialPageRoute(
          builder: (_) => const BankInfo(),
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
