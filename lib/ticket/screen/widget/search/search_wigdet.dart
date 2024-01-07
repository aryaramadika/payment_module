import 'package:flutter/material.dart';
import 'package:payment_module/payment/screens/widget/button/button.dart';
import 'package:payment_module/payment/style/styles.dart';
import 'package:payment_module/ticket/screen/widget/input/input_passanger.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  int numOfPassenger = 0;
  String activeAirport = "from airport";

  @override
  Widget build(BuildContext context) {
    String pickupText =
        activeAirport == "from airport" ? "Destination" : "Pick-up";

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AIRPORT TABS
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeAirport = "from airport";
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  decoration: BoxDecoration(
                    color: activeAirport == "from airport"
                        ? primary
                        : Color(0xffF8F9FC),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: activeAirport == "from airport"
                          ? primary
                          : Color(0xffE9E9E9),
                    ),
                  ),
                  child: Text(
                    "From Airport",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: semiBold,
                      color:
                          activeAirport == "from airport" ? whiteColor : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeAirport = "to airport";
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: activeAirport == "to airport"
                          ? primary
                          : Color(0xffE9E9E9),
                    ),
                    color: activeAirport == "to airport"
                        ? primary
                        : Color(0xffF8F9FC),
                  ),
                  child: Text(
                    "To Airport",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: activeAirport == "to airport" ? whiteColor : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pickupText,
                  style: TextStyle(
                    fontWeight: semiBold,
                    fontSize: 16,
                    fontFamily: "Poppins",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                // Location Search
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFACACAC),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/location_point.png",
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Wonderful Hotel",
                        style: TextStyle(
                          fontWeight: semiBold,
                          fontSize: 16,
                          fontFamily: "Poppins",
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: InputPassanger(numOfPassanger: numOfPassenger),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const ButtonWidget(
            isButtonDisabled: false,
            title: "Search Transportation",
            paddinHorizontal: 0,
            paddingVertical: 0,
          ),
        ],
      ),
    );
  }
}
