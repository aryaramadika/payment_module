import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';

class ButtonRedeemWidget extends StatelessWidget {
  const ButtonRedeemWidget(
      {super.key,
      required this.isButtonDisabled,
      required this.title,
      required this.paddinHorizontal,
      required this.paddingVertical});

  final bool isButtonDisabled;
  final String title;
  final double paddinHorizontal;
  final double paddingVertical;

  @override
  Widget build(BuildContext context) {
    print("is disable $isButtonDisabled");
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: paddinHorizontal, vertical: paddingVertical),
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/scan-qr');
          // Your button logic goes here
          // print('Button pressed!');
        },
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 37)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Set border radius
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: primary), // Set border color to primary
          ),
          // You can customize other button properties here
        ),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: medium, color: primary, fontFamily: "Poppins"),
        ),
      ),
    );
  }
}
