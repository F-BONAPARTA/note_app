import 'dart:math';
import 'package:flutter/material.dart';

method() {
  var rng = new Random();
  var number = rng.nextInt(6);
  switch (number) {
    case 0:
      return color0;
      break;
    case 1:
      return color1;
      break;

    case 2:
      return color2;
      break;
    case 3:
      return color3;
      break;

    case 4:
      return color4;
      break;

    case 5:
      return color5;
      break;
  }
}

var color0 = Color(0xFFFFAB91);
var color1 = Color(0xFFFFCC80);
var color2 = Color(0xFFE6EE9B);
var color3 = Color(0xFF80DEEA);
var color5 = Color(0xFF80CBC4);
var color4 = Color(0xFFF48FB1);
