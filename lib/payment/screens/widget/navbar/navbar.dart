import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';

class CheckoutNavbar extends StatefulWidget {
  const CheckoutNavbar({super.key, required this.title});
  final String title;

  @override
  State<CheckoutNavbar> createState() => _CheckoutNavbarState();
}

class _CheckoutNavbarState extends State<CheckoutNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: primary),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
      child: Container(
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 24,
              child: IconButton(
                onPressed: () {},
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
    );
  }
}
