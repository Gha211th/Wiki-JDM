import 'package:flutter/material.dart';

class BrandColors {
  static Map<String, Color> colors = {
    'Honda': Colors.redAccent,
    'Nissan': Colors.orangeAccent, // lebih identik dibanding biru
    'Toyota': Colors.grey, // cocok karena logo silver
    'Mazda': Colors.indigo, // warna resmi brand
    'Subaru': Colors.indigo, // biru Subaru
    'Mitsubishi': Colors.red[700]!,
  };

  static Color getColor(String brand) {
    return colors[brand] ?? Colors.grey; // fallback jika tidak ada
  }
}
