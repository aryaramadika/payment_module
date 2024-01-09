import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              Icons.circle,
              color: whiteColor,
              size: 16,
            ),
            Text(
              "Fill in info",
              style: TextStyle(color: whiteColor, fontWeight: medium),
            )
          ],
        ),
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
              color: whiteColor,
              size: 16,
            ),
            Text(
              "Review",
              style: TextStyle(color: whiteColor, fontWeight: medium),
            )
          ],
        ),
      ],
    );
  }
}
