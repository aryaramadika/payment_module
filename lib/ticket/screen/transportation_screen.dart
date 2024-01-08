import 'package:flutter/material.dart';
import 'package:payment_module/ticket/screen/widget/search/search_boat.dart';
import 'package:payment_module/ticket/screen/widget/search/search_wigdet.dart';

class TransportationScreen extends StatefulWidget {
  const TransportationScreen({Key? key, required this.selectedTicketType})
      : super(key: key);

  final String selectedTicketType;

  @override
  State<TransportationScreen> createState() => _TransportationScreenState();
}

class _TransportationScreenState extends State<TransportationScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (widget.selectedTicketType == "Bus")
            Container(
              child: Text("Bus Container"),
            ),
          if (widget.selectedTicketType == "Boat")
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 234, 241, 248),
                      ),
                    ),
                  ),
                  child: SearchBoatWidget(),
                ),
                Container(
                  child: Text("Boat Container"),
                ),
              ],
            ),
          if (widget.selectedTicketType == "Airport")
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 234, 241, 248),
                      ),
                    ),
                  ),
                  child: SearchWidget(),
                ),
                Container(
                  child: Text("Airport Container"),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
