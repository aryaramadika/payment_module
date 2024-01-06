import 'package:flutter/material.dart';
import 'package:payment_module/payment/model/voucher_model.dart';
import 'package:payment_module/payment/screens/widget/header/modal_header.dart';
import 'package:payment_module/payment/screens/widget/voucher_list/voucher_list.dart';
import 'package:payment_module/payment/style/styles.dart';

class CoupunWidget extends StatelessWidget {
  const CoupunWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    List<VoucherTypeData> availableVouchers = [
      VoucherTypeData(
        title: "Transportation",
        desc: "Applied for first purchase ",
        dueDate: "24 Dec 2024",
        number: 5,
      ),
      VoucherTypeData(
        title: "Car Rental",
        desc: "Applied for first purchase ",
        dueDate: "24 Dec 2024",
        number: 10,
      ),
      VoucherTypeData(
        title: "Bike Rental",
        desc: "Applied for first purchase ",
        dueDate: "24 Dec 2024",
        number: 20,
      ),
      VoucherTypeData(
        title: "Activity",
        desc: "Applied for first purchase ",
        dueDate: "24 Dec 2024",
        number: 30,
      ),
    ];

    return Container(
      height: 670,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
        color: whiteColor,
      ),
      child: Column(
        children: [
          const ModalHeader(
            title: "My Vouchers",
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [VoucherList(availableVouchers: availableVouchers)],
            ),
          ),
        ],
      ),
    );
  }
}
