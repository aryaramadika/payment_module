import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';

class CheckoutNavbar extends StatefulWidget {
  const CheckoutNavbar(
      {super.key,
      required this.title,
      required this.steps,
      required this.routes});
  final String title;
  final Widget steps;
  final String routes;

  @override
  State<CheckoutNavbar> createState() => _CheckoutNavbarState();
}

class _CheckoutNavbarState extends State<CheckoutNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: primary),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
      child: Column(
        children: [
          Container(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 24,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, widget.routes);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: whiteColor,
                    ),
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 20, fontWeight: semiBold, color: whiteColor),
                ),
                SizedBox(
                  width: 24,
                  child: Image.asset(
                    "assets/images/bell.png",
                    height: 24,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.steps,
                SizedBox(
                  width: 18,
                ),
                Image.asset(
                  "assets/images/dash.png",
                  width: 49,
                ),
                SizedBox(
                  width: 18,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Color(0xffEC8433),
                      size: 16,
                    ),
                    Text(
                      "Payment",
                      style: TextStyle(color: whiteColor, fontWeight: semiBold),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
