import 'package:flutter/material.dart';
import 'package:payment_module/payment/screens/widget/header/modal_header.dart';
import 'package:payment_module/payment/style/styles.dart';

class GuildeModal extends StatelessWidget {
  const GuildeModal({super.key});

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
            title: "Payment Guidance",
          ),

          //Note: Card
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 34,
            ),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 2, color: Color.fromARGB(255, 234, 241, 248)))),
            child: Column(children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                child: Text(
                  "Card Payment Process Guide",
                  style: TextStyle(
                      color: blackColor, fontWeight: semiBold, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              for (int i = 0; i < cardPaymentSteps.length; i++)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  child: Text(
                    '${i + 1}. ${cardPaymentSteps[i]}',
                    style: TextStyle(fontSize: 14, fontWeight: medium),
                    textAlign: TextAlign.start,
                  ),
                ),
            ]),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 34,
            ),
            child: Column(children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                child: Text(
                  "Store Payment Process Guide",
                  style: TextStyle(
                      color: blackColor, fontWeight: semiBold, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              for (int i = 0; i < storePaymentSteps.length; i++)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  child: Text(
                    '${i + 1}. ${storePaymentSteps[i]}',
                    style: TextStyle(fontSize: 14, fontWeight: medium),
                    textAlign: TextAlign.start,
                  ),
                ),
            ]),
          ),
        ],
      ),
    );
  }
}
