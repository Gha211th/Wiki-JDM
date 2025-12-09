import 'package:flutter/material.dart';

class BrandFilterList extends StatelessWidget {
  final List<String> brands;
  final String selectedBrand;
  final Function(String) onSelected;

  const BrandFilterList({
    super.key,
    required this.brands,
    required this.selectedBrand,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 12,
        runSpacing: 12,
        children: brands.map((brand) {
          final isSelected = brand == selectedBrand;

          return GestureDetector(
            onTap: () => onSelected(brand),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.white10,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: isSelected ? Colors.white : Colors.white54,
                  width: 1.5,
                ),
              ),
              child: Text(
                brand,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
