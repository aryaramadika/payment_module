import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/ticket/screen/airport/available_cars.dart';

class AirportWidget extends StatefulWidget {
  const AirportWidget({super.key});

  @override
  State<AirportWidget> createState() => _AirportWidgetState();
}

class _AirportWidgetState extends State<AirportWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: const Column(
        children: [
          AvailableCarsWidget(
            title: "Available Cars",
          ),
          SizedBox(
            height: 20,
          ),
          AvailableCarsWidget(
            title: "Popular Destination",
          ),
          SizedBox(
            height: 20,
          ),
          AvailableCarsWidget(
            title: "Travelling Tips",
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
