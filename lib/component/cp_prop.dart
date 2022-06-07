import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class Com{
  static String str(String target, String field){
    if(target.length != 0){
      return target;
    }
    return field;
  }
  static double clamp(double length, double flexible){
    return length-flexible*length;
  }
}