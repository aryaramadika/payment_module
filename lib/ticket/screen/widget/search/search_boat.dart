import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payment_module/payment/screens/widget/button/button.dart';
import 'package:payment_module/payment/style/styles.dart';

class SearchBoatWidget extends StatefulWidget {
  const SearchBoatWidget({Key? key}) : super(key: key);

  @override
  State<SearchBoatWidget> createState() => _SearchBoatWidgetState();
}

class _SearchBoatWidgetState extends State<SearchBoatWidget> {
  int numOfPassenger = 0;
  String activeAirport = "from airport";
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        "${_getFormattedDay(dateTime)}, ${_getFormattedDate(dateTime)} - ${_getFormattedTime(dateTime)}";

    Future<DateTime?> pickDate() => showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AIRPORT TABS

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From",
                  style: TextStyle(
                    fontWeight: semiBold,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    color: greyColor,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bali",
                            style: TextStyle(
                                fontWeight: semiBold,
                                fontSize: 12,
                                fontFamily: "Poppins",
                                color: greyColor),
                          ),
                          Text(
                            "Pelabuhan Benoa",
                            style: TextStyle(
                              fontWeight: semiBold,
                              fontSize: 16,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "To",
                  style: TextStyle(
                    fontWeight: semiBold,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    color: greyColor,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nusa Penida",
                            style: TextStyle(
                                fontWeight: semiBold,
                                fontSize: 12,
                                fontFamily: "Poppins",
                                color: greyColor),
                          ),
                          Text(
                            "Pelabuhan Tradisional Sampalan",
                            style: TextStyle(
                              fontWeight: semiBold,
                              fontSize: 16,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date and Time",
                  style: TextStyle(
                    fontWeight: semiBold,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    color: greyColor,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                // Location Search
                GestureDetector(
                  onTap: pickDateTime,
                  child: Container(
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
                          "assets/images/Calender.png",
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          " $formattedDate",
                          style: TextStyle(
                            fontWeight: semiBold,
                            fontSize: 16,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const ButtonWidget(
            isButtonDisabled: false,
            title: "Search Boat",
            paddinHorizontal: 0,
            paddingVertical: 0,
          ),
        ],
      ),
    );
  }

  String _getFormattedDay(DateTime dateTime) {
    return DateFormat('E').format(dateTime);
  }

  String _getFormattedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  String _getFormattedTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  Future pickDateTime() async {
    final date = await pickDate();
    if (date == null) return;

    final time = await pickTime();
    if (time == null) return;

    final newdatetime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);

    setState(() {
      this.dateTime = newdatetime;
    });
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );
}
