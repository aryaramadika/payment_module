import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';

class HeaderTransportationWigdet extends StatefulWidget {
  const HeaderTransportationWigdet(
      {super.key,
      required this.selectedTicketType,
      required this.onChangedTicketType});
  final String selectedTicketType;
  final void Function(String) onChangedTicketType;
  @override
  State<HeaderTransportationWigdet> createState() =>
      _HeaderTransportationWigdetState();
}

class _HeaderTransportationWigdetState
    extends State<HeaderTransportationWigdet> {
  int selectedContainerIndex = 1; // Initialize with an index that doesn't exist

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 32),
      child: Row(
        children: [
          buildTransportationContainer(0, "Boat"),
          const SizedBox(width: 30),
          buildTransportationContainer(1, "Airport"),
          const SizedBox(width: 30),
          buildTransportationContainer(2, "Bus"),
        ],
      ),
    );
  }

  Widget buildTransportationContainer(int index, String label) {
    bool isSelected = widget.selectedTicketType == label;
    String imagePath = '';

    // Assign the appropriate image path based on the label
    if (label == "Boat") {
      imagePath = "assets/images/boat.png";
    } else if (label == "Airport") {
      imagePath = "assets/images/airplane-fill.png";
    } else if (label == "Bus") {
      imagePath = "assets/images/bus.png";
    }

    return GestureDetector(
      onTap: () {
        widget.onChangedTicketType(label);
      },
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: isSelected ? primary : Color(0xffE9E9E9),
              borderRadius: BorderRadius.circular(200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(1, 1),
                  blurRadius: 2,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColorFiltered(
                    colorFilter: isSelected
                        ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                        : const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    child: Image(
                      width: 36,
                      height: 36,
                      image: AssetImage(imagePath),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          // Uncomment the following lines if you want to display the label text
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: semiBold,
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }
}
