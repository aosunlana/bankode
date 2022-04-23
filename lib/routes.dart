import 'dart:io';
import 'package:bankode/data/models/banks.dart';
import 'package:bankode/presentation/screens/bank_view/bank_view.dart';
import 'package:bankode/presentation/screens/camera_view/camera_view.dart';
import 'package:bankode/presentation/screens/camera_view/gallery_view.dart';
import 'package:bankode/presentation/screens/entry_view.dart';
import 'package:bankode/presentation/screens/home_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/splash_screen.dart';

class RouteGenerator {
  static const String entryView = '/';
  static const String homeView = '/home';
  static const String randomView = '/random';
  static const String bankInfo = '/bankInfo';
  static const String cameraView = '/camera';
  static const String galleryView = '/gallery';
  static const String splashScreen = '/splashScreen';

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
          builder: (_) => BankInfo(
            bank: bank,
          ),
        );
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case cameraView:
        final camera = settings.arguments as List<CameraDescription>;
        return MaterialPageRoute(
          builder: (_) => CameraScreen(cameras: camera),
        );
      case galleryView:
        final images = settings.arguments as List<File>;
        return MaterialPageRoute(
          builder: (_) => GalleryScreen(
            images: images,
          ),
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
