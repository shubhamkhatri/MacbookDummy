import 'package:flutter/material.dart';

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

Color colorFromRGBO(int red, int green, int blue, double opacity) {
  return Color.fromRGBO(red, green, blue, opacity);
}