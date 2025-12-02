import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/car_detail_page.dart';
import 'package:flutter_application_1/data/car_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Future Cars Catalog")),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: carList.length,
        itemBuilder: (context, index) {
          final car = carList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailPage(car: car)),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: Image.asset(car.image, fit: BoxFit.cover),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        car.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
