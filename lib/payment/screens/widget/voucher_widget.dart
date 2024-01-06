import 'package:flutter/material.dart';
import 'package:payment_module/payment/model/voucher_model.dart';
import 'package:payment_module/payment/screens/widget/modal/coupun_modal.dart';
import 'package:payment_module/payment/style/styles.dart';

class VouchersWidget extends StatefulWidget {
  const VouchersWidget({super.key});

  @override
  State<VouchersWidget> createState() => _VouchersWidgetState();
}

class _VouchersWidgetState extends State<VouchersWidget> {
  void _openCoupunModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return const CoupunWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Use Vouchers!",
            style: TextStyle(
              fontSize: 16,
              fontWeight: semiBold,
              fontFamily: "Poppins",
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: _openCoupunModal,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 1,
                  color: const Color(0XFFACACAC),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/voucher.png',
                    width: 20,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Select Vouchers",
                    style: TextStyle(
                        fontWeight: medium,
                        fontSize: 16,
                        fontFamily: "Poppins"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
