import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/car.dart';

class DetailPage extends StatelessWidget {
  final Car car;

  const DetailPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 800; // breakpoint sederhana

    return Scaffold(
      appBar: AppBar(title: Text(car.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildMobileLayout(),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: _buildLeftCard()),
                  const SizedBox(width: 20),
                  Expanded(flex: 1, child: _buildSpecsCard()),
                ],
              ),
      ),
    );
  }

  // --- MOBILE LAYOUT ---
  List<Widget> _buildMobileLayout() {
    return [_buildLeftCard(), const SizedBox(height: 20), _buildSpecsCard()];
  }

  // --- LEFT CARD (Image + Name + Desc) ---
  Widget _buildLeftCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 16 / 9, // bikin responsive tidak terpotong
                child: Image.asset(car.image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              car.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(car.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text(
              "Car History",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus tristique magna vel mi tincidunt, sed posuere sapien aliquam. Nulla facilisi. Donec aliquam, purus sed hendrerit tempus, justo ante luctus odio, sed porta nunc nibh non mauris. Cras non facilisis ipsum. Mauris elementum augue nec massa efficitur, non fermentum metus malesuada.",
              style: TextStyle(fontSize: 15, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }

  // --- RIGHT CARD (Specifications) ---
  Widget _buildSpecsCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "More Specifications",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text("Color: ${car.color}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text(
              "Engine Type: ${car.engine}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text("Engine: ${car.engine}", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
