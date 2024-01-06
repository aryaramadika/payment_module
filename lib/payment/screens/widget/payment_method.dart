import 'package:flutter/material.dart';
import 'package:payment_module/payment/model/payment_model.dart';
import 'package:payment_module/payment/screens/widget/payment_list/payment_list.dart';
import 'package:payment_module/payment/style/styles.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({
    super.key,
    required this.listPayments,
    required this.onPaymentSelected,
  });

  final List<PaymentTypeData> listPayments;
  final Function(String) onPaymentSelected; // Add this line

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "Payment Method",
              style: TextStyle(
                fontSize: 16,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          PaymentList(
            paymentTypes: widget.listPayments,
            onPaymentSelected: widget.onPaymentSelected,
          )
        ],
      ),
    );
  }
}
