import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/car_detail_page.dart';
import 'package:flutter_application_1/data/car_data.dart';
import 'package:flutter_application_1/utils/brand_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = "";

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

  double getFontSizeForTitle(double width) {
    if (width >= 1600) return 18;
    if (width >= 1200) return 17;
    if (width >= 800) return 14;
    if (width >= 480) return 13;
    return 10;
  }

  double getFontSizeForEngine(double width) {
    if (width >= 1600) return 12;
    if (width >= 1200) return 10;
    if (width >= 800) return 8;
    if (width >= 480) return 8;
    return 7;
  }

  double getFontSizeForTypeBrand(double width) {
    if (width >= 1600) return 10;
    if (width >= 1200) return 9;
    if (width >= 800) return 8;
    if (width >= 480) return 8;
    return 7;
  }

  double getFontSizeForTitleApp(double width) {
    if (width >= 1600) return 34;
    if (width >= 1200) return 30;
    if (width >= 800) return 26;
    if (width >= 480) return 22;
    return 20;
  }

  double getFontSizeForTopTitleApp(double width) {
    if (width >= 1600) return 13;
    if (width >= 1200) return 12;
    if (width >= 800) return 11;
    if (width >= 480) return 10;
    return 9;
  }

  double getFontSizeForSubTitle(double width) {
    if (width >= 1600) return 15;
    if (width >= 1200) return 14;
    if (width >= 800) return 13;
    if (width >= 480) return 12;
    return 11;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columnCount = getResponsiveColumn(width);
    final aspectRatio = getAspectRatio(width);
    final fontSizeForTitle = getFontSizeForTitle(width);
    final fontSizeForEngine = getFontSizeForEngine(width);
    final fontSizeForBrand = getFontSizeForTypeBrand(width);
    final fontSizeForAppTitle = getFontSizeForTitleApp(width);
    final fontSizeForTopText = getFontSizeForTopTitleApp(width);
    final fontSizeForSubtitle = getFontSizeForSubTitle(width);

    // Filter mobil berdasarkan pencarian
    final filteredCars = carList.where((car) {
      return car.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '~ The Point Of JDM ~',
                style: TextStyle(
                  fontSize: fontSizeForTopText,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Banter JDM Car",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: fontSizeForAppTitle,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "The wiki of jdm car",
                style: TextStyle(
                  fontSize: fontSizeForSubtitle,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) {
                setState(() => searchQuery = value);
              },
              decoration: InputDecoration(
                hintText: "Search car name...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white10,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white54, // warna outline normal
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white70, // warna ketika fokus
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columnCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: aspectRatio,
              ),
              itemCount: filteredCars.length,
              itemBuilder: (context, index) {
                final car = filteredCars[index];
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Image.asset(car.image, fit: BoxFit.cover),
                        ),

                        const SizedBox(height: 15),

                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  car.name,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontSizeForTitle,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  car.engine,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontSizeForEngine,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: BrandColors.getColor(car.brand),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    car.brand,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: fontSizeForBrand,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
