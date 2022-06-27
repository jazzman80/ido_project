import 'package:flutter/material.dart';

ThemeData appTheme(context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
    ).copyWith(
      onPrimary: Colors.white,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Theme.of(context).colorScheme.primary,
    ),
  );
}
