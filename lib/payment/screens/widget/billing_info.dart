import 'package:flutter/material.dart';
import 'package:payment_module/payment/model/billing_model.dart';
import 'package:payment_module/payment/style/styles.dart';
import 'package:intl/intl.dart';

class BillingInformation extends StatelessWidget {
  const BillingInformation(
      {Key? key, required this.bills, required this.total});

  final List<BillingDetail> bills;

  final double total;

  Widget billingDetail(String title, double amount) {
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color.fromARGB(255, 234, 241, 248),
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: title == "Total" ? semiBold : medium,
                fontSize: title == "Total" ? 16 : 14,
                fontFamily: "Poppins",
              ),
            ),
            Text(
              "${currencyFormat.format(amount)}",
              style: TextStyle(
                fontWeight: title == "Total" ? semiBold : medium,
                fontSize: title == "Total" ? 16 : 14,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 234, 241, 248),
          ),
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
                    style: TextStyle(
                      fontWeight: semiBold,
                      fontSize: 16,
                      fontFamily: "Poppins",
                    ),
                  ),
                  Text(
                    "Include tax",
                    style: TextStyle(
                      fontWeight: semiBold,
                      fontSize: 14,
                      fontFamily: "Poppins",
                      color: greyColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ...bills
                .map((bill) => billingDetail(bill.name, bill.amount))
                .toList(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 234, 241, 248),
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontWeight: semiBold,
                        fontSize: 16,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      "${currencyFormat.format(total)}",
                      style: TextStyle(
                        fontWeight: semiBold,
                        fontSize: 16,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
