import 'package:flutter/material.dart';
import 'package:payment_module/payment/screens/widget/navbar/navbar.dart';
import 'package:payment_module/payment/style/styles.dart';
import 'package:payment_module/ticket/screen/transportation_screen.dart';
import 'package:payment_module/ticket/screen/widget/header/header.dart';
import 'package:payment_module/ticket/screen/widget/navbar/navbar.dart';

class Transportation extends StatefulWidget {
  const Transportation({super.key});

  @override
  State<Transportation> createState() => _TransportationState();
}

class _TransportationState extends State<Transportation> {
  String selectedTicketType = "Boat"; // Default selected ticket type
  String headerTitle = "Boat Transport";

  void onChangeTicketType(String ticketType) {
    setState(() {
      selectedTicketType = ticketType;

      // Update headerTitle based on selected ticket type
      if (selectedTicketType == "Airport") {
        headerTitle = "Airport Transport";
      }
      if (selectedTicketType == "Boat") {
        headerTitle = "Boat Transport";
      }
      if (selectedTicketType == "Bus") {
        headerTitle = "Bus Transport";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          Navbar(
            title: headerTitle,
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(
                width: 1,
                color: Color.fromARGB(255, 234, 241, 248),
              ),
            )),
            child: HeaderTransportationWigdet(
              onChangedTicketType: onChangeTicketType,
              selectedTicketType: selectedTicketType,
            ),
          ),
          Expanded(
            child: TransportationScreen(
              selectedTicketType: selectedTicketType,
            ),
          )
        ],
      ),
    );
  }
}
