import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/car.dart';
import 'package:flutter_application_1/utils/brand_color.dart';

class DetailPage extends StatelessWidget {
  final Car car;

  const DetailPage({super.key, required this.car});

  double getFontSizeForTypeBrand(double width) {
    if (width >= 1600) return 15;
    if (width >= 1200) return 14;
    if (width >= 800) return 13;
    if (width >= 480) return 12;
    return 11;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 900;
    final fontSizeForBrand = getFontSizeForTypeBrand(width);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Row(
          children: [
            Text(car.name),
            const SizedBox(width: 15),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: BrandColors.getColor(car.brand),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                '${car.brand}',
                style: TextStyle(fontSize: fontSizeForBrand),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: isMobile
            ? _buildMobileLayout(fontSizeForBrand)
            : _buildDesktopLayout(fontSizeForBrand),
      ),
    );
  }

  // ============================
  // DESKTOP LAYOUT
  // ============================
  Widget _buildDesktopLayout(double fontSizeForBrand) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------- IMAGE ----------
        Expanded(
          flex: 2,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(car.image, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        // ---------- RIGHT SIDE ----------
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHistoryCard(fontSizeForBrand),
              const SizedBox(height: 20),
              _buildSpecsCard(),
            ],
          ),
        ),
      ],
    );
  }

  // ============================
  // MOBILE LAYOUT
  // ============================
  Widget _buildMobileLayout(double fontSizeForBrand) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(car.image, fit: BoxFit.cover),
              ),
            ),
          ),

          const SizedBox(height: 20),

          _buildHistoryCard(fontSizeForBrand),
          const SizedBox(height: 20),
          _buildSpecsCard(),
        ],
      ),
    );
  }

  // ============================
  // CARDS
  // ============================

  Widget _buildSpecsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Specifications",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text("Color: ${car.color}", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("Engine Type: ${car.engine}", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("Speed: ${car.speed}", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  // menerima *fontSizeForBrand* dari build()
  Widget _buildHistoryCard(double fontSizeForBrand) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              car.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              "Initial D iconic Car~",
              style: TextStyle(fontSize: 15, color: Colors.white70),
            ),

            const SizedBox(height: 10),

            // Brand Chip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: BrandColors.getColor(car.brand),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                "${car.brand}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: fontSizeForBrand,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              "Car History",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Vivamus tristique magna vel tincidunt, sed posuere sapien aliquam. "
              "Donec accumsan nisi id massa dignissim, nec fermentum metus ullamcorper. "
              "Mauris vehicula felis nec sem suscipit, et pulvinar est pharetra.",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
