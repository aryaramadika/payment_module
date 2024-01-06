import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required this.isButtonDisabled, required this.title});

  final bool isButtonDisabled;
  final String title;

  @override
  Widget build(BuildContext context) {
    print("is disable $isButtonDisabled");
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextButton(
        onPressed: () {
          // Your button logic goes here
          // print('Button pressed!');
        },
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 50)),
          backgroundColor: MaterialStateProperty.all(
              isButtonDisabled ? const Color(0xffE9E9E9) : primary),
          // You can customize other button properties here
        ),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: medium,
              color: isButtonDisabled ? greyColor : whiteColor),
        ),
      ),
    );
  }
}
