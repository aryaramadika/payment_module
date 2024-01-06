import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';

class ModalHeader extends StatelessWidget {
  const ModalHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36), topRight: Radius.circular(36)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: whiteColor,
              weight: 2,
            ),
          ),
          const SizedBox(
            width: 54,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: bold,
              color: whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
