import 'package:flutter/material.dart';
import 'package:payment_module/payment/model/billing_model.dart';
import 'package:payment_module/payment/screens/paymet_screen.dart';
import 'package:payment_module/payment/screens/widget/header/header.dart';
import 'package:payment_module/payment/screens/widget/navbar/navbar.dart';
import 'package:payment_module/payment/style/styles.dart';

class PaymentArguments {
  final Widget detailWidget;
  final Widget steps;
  final String routes;
  final int totalPrice;
  final List<BillingDetail> bills;

  PaymentArguments(
      this.detailWidget, this.steps, this.routes, this.totalPrice, this.bills);
}

class Payment extends StatelessWidget {
  const Payment({Key? key});

  @override
  Widget build(BuildContext context) {
    final dynamicWidget =
        ModalRoute.of(context)!.settings.arguments as PaymentArguments;

    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          CheckoutNavbar(
            title: "Checkout",
            steps: dynamicWidget.steps,
            routes: dynamicWidget.routes,
          ),
          Expanded(
            child: PaymentScreen(
              widgets: dynamicWidget.detailWidget,
            ),
          ),
        ],
      ),
    );
  }
}
