import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/car.dart';

class DetailPage extends StatelessWidget {
  final Car car;

  const DetailPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(car.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.asset(car.image, height: 200, fit: BoxFit.cover),

          const SizedBox(height: 16),

          Text(
            car.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(car.description),

          const SizedBox(height: 20),

          const Text(
            "Attributes",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          ...car.attributes.entries.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e.key),
                  Text(
                    e.value,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Power Level",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          LinearProgressIndicator(value: car.level, minHeight: 12),

          const SizedBox(height: 8),

          Text("${(car.level * 100).toInt()}%"),
        ],
      ),
    );
  }
}
