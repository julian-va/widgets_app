import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.white,
  Colors.black,
  Colors.red,
  Colors.yellow,
  Colors.brown,
  Colors.lightBlueAccent
];

class AppTheme {
  final int selectedColor;

  AppTheme(this.selectedColor)
      : assert(selectedColor >= 0 || selectedColor > colorList.length - 1,
            'El color debe de ser mayor o igual a cero y menor o igual a ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}
