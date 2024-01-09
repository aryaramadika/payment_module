import 'package:flutter/material.dart';
import 'package:payment_module/payment/screens/widget/billing_info.dart';
import 'package:payment_module/payment/style/styles.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 158,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/dummy.png',
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Package A",
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Sunshine Jungle Bali",
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: semiBold,
                        fontFamily: "Poppins",
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Quantity: 1",
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: medium,
                        fontSize: 14,
                        color: greyColor,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: Text(
                        "Rp 750.000",
                        // textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: semiBold,
                          fontSize: 20,
                          fontFamily: "Poppins",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
        // const BillingInformation()
      ],
    );
  }
}
