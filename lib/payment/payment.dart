import 'package:flutter/material.dart';
import 'package:payment_module/payment/screens/paymet_screen.dart';
import 'package:payment_module/payment/screens/widget/header/header.dart';
import 'package:payment_module/payment/screens/widget/navbar/navbar.dart';
import 'package:payment_module/payment/style/styles.dart';

class Payment extends StatelessWidget {
  const Payment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: const Column(
        children: [
          CheckoutNavbar(),
          Expanded(
            child: PaymentScreen(
              widgets: Header(),
            ),
          ),
        ],
      ),
    );
  }
}
