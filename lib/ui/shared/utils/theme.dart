import 'package:flutter/material.dart';

ThemeData bankodeTheme() {
  final bankodeTheme = ThemeData.dark();
  const mainColor = Colors.lightBlue;
  return bankodeTheme.copyWith(
    buttonTheme: bankodeTheme.buttonTheme.copyWith(),
    cardColor: Color.lerp(mainColor, Colors.white, 0.2),
    cardTheme: bankodeTheme.cardTheme.copyWith(
      color: Color.lerp(mainColor, Colors.black, 0.1),
      margin: const EdgeInsets.all(20.0),
      elevation: 0.0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
        side: const BorderSide(color: Colors.white24, width: 1),
      ),
    ),
  );
}