import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';

class BillingInformation extends StatelessWidget {
  const BillingInformation({super.key});

  Widget billingDetail(String title, String amount, bool isTotal) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(
          width: 1,
          color: Color.fromARGB(255, 234, 241, 248),
        ),
      )),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              // textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: isTotal ? semiBold : medium,
                  fontSize: isTotal ? 16 : 14,
                  fontFamily: "Poppins"),
            ),
            Text(
              amount,
              // textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: isTotal ? semiBold : medium,
                  fontSize: isTotal ? 16 : 14,
                  fontFamily: "Poppins"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal:
              BorderSide(width: 2, color: Color.fromARGB(255, 234, 241, 248)),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Billing Information",
                    // textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: semiBold,
                        fontSize: 16,
                        fontFamily: "Poppins"),
                  ),
                  Text(
                    "Include tax",
                    // textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: semiBold,
                        fontSize: 14,
                        fontFamily: "Poppins",
                        color: greyColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            billingDetail("Basic fee", "Rp 200.000", false),
            billingDetail("Delivery Fee", "Rp 200.000", false),
            billingDetail("Total", "Rp 400.000", true),
          ],
        ),
      ),
    );
  }
}
