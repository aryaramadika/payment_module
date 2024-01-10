import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';
import 'package:payment_module/ticket/screen/airport/widget/cars_section.dart';

class AvailableCarsWidget extends StatelessWidget {
  const AvailableCarsWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Title Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "see all",
                style: TextStyle(color: primary),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          // Available List Car
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 270,
              child: Row(
                children: [
                  CarsSection(
                      name: "Avanza Matic",
                      imageUrl: "assets/images/dummyCar.png",
                      location: "Sunshine Rental"),
                  SizedBox(
                    width: 16,
                  ),
                  CarsSection(
                      name: "Avanza Matic",
                      imageUrl: "assets/images/dummyCar.png",
                      location: "Sunshine Rental"),
                  SizedBox(
                    width: 16,
                  ),
                  CarsSection(
                      name: "Avanza Matic",
                      imageUrl: "assets/images/dummyCar.png",
                      location: "Sunshine Rental"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
