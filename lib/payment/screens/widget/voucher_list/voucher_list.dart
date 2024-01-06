import 'package:flutter/material.dart';
import 'package:payment_module/payment/model/voucher_model.dart';
import 'package:payment_module/payment/style/styles.dart';

class VoucherList extends StatelessWidget {
  const VoucherList({Key? key, required this.availableVouchers})
      : super(key: key);

  final List<VoucherTypeData> availableVouchers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: availableVouchers.map((voucher) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(1, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: GestureDetector(
            child: Column(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 38, horizontal: 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFF07F87),
                            Color(0xFF7F1CA2),
                          ],
                        ),
                      ),
                      child: Text(
                        "${voucher.number}% \n OFF",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: semiBold,
                          fontFamily: "Poppins",
                          color: whiteColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                voucher.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                voucher.desc,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: regular,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Valid until ${voucher.dueDate}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: regular,
                              fontFamily: "Poppins",
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
