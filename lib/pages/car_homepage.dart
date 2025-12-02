import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/car_detail_page.dart';
import 'package:flutter_application_1/data/car_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  int getResponsiveColumn(double width) {
    if (width >= 1600) return 6;
    if (width >= 1200) return 5;
    if (width >= 800) return 4;
    if (width >= 480) return 3;
    return 2;
  }

  double getAspectRatio(double width) {
    if (width >= 1600) return 1;
    if (width >= 1200) return 0.9;
    if (width >= 800) return 0.8;
    if (width >= 480) return 0.75;
    return 0.65;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columnCount = getResponsiveColumn(width);
    final aspectRatio = getAspectRatio(width);

    return Scaffold(
      appBar: AppBar(title: const Text("Future Cars Catalog")),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: aspectRatio,
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
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
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
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
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
