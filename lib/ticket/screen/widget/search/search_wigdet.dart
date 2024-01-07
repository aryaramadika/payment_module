import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';

class SearchWigdet extends StatefulWidget {
  const SearchWigdet({super.key});

  @override
  State<SearchWigdet> createState() => _SearchWigdetState();
}

class _SearchWigdetState extends State<SearchWigdet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xffF8F9FC),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xffE9E9E9),
                  ),
                ),
                child: Text(
                  "From Airport",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: semiBold),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: primary,
                  ),
                  color: primary,
                ),
                child: Text(
                  "To Airport",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                    color: whiteColor,
                    fontWeight: semiBold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
