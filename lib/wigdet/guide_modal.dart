import 'package:flutter/material.dart';
import 'package:payment_module/payment/screens/widget/header/modal_header.dart';
import 'package:payment_module/payment/style/styles.dart';
import 'package:payment_module/wigdet/button/button.dart';

class RedeemModal extends StatelessWidget {
  const RedeemModal({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> cardPaymentSteps = [
      'Select card payment method',
      'Enter your card number',
      'Fill in your card expiry date',
      'Enter your card security code(CVC)',
      'Press confirm to purchase your item',
      'and have fun'
    ];
    List<String> storePaymentSteps = [
      'Select store payment method',
      'Go to the selected store',
      'Show your transaction id in the detail ticket page',
      'Pay using any method available on the selected store.',
      'Enjoy your product'
    ];
    return Container(
      height: 670,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36), topRight: Radius.circular(36)),
        color: whiteColor,
      ),
      child: Column(
        children: [
          const ModalHeader(
            title: "Redeem",
          ),

          //Note: Card
          Container(
            padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 188,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/phone.png"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "You will get 150 Coins and use it for any purchase!",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff838383),
                      fontWeight: medium),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                const ButtonRedeemWidget(
                    isButtonDisabled: false,
                    title: "Redeem Coin",
                    paddinHorizontal: 0,
                    paddingVertical: 0)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
