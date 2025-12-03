import 'package:flutter/material.dart';

class BrandColors {
  static const Map<String, Color> colors = {
    'Honda': Colors.redAccent,
    'Nissan': Colors.red, // lebih identik dibanding biru
    'Toyota': Colors.grey, // cocok karena logo silver
    'Mazda': Colors.indigo, // warna resmi brand
    'Subaru': Colors.indigo, // biru Subaru
    'Mitsubishi': Colors.deepOrange,
  };

  static Color getColor(String brand) {
    return colors[brand] ?? Colors.grey; // fallback jika tidak ada
  }
}
