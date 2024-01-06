import 'package:flutter/material.dart';
import 'package:payment_module/payment/model/payment_model.dart';
import 'package:payment_module/payment/screens/widget/modal/guide_modal.dart';
import 'package:payment_module/payment/style/styles.dart';

class PaymentList extends StatefulWidget {
  const PaymentList(
      {super.key, required this.paymentTypes, required this.onPaymentSelected});
  final List<PaymentTypeData> paymentTypes;
  final Function(String) onPaymentSelected;

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  String selectedPaymentIndex = "-1"; // Initialize with an invalid index

  void _openGuideModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return const GuildeModal();
      },
    );
  }

  void _onPaymentTypeSelected(String index, String name) {
    setState(() {
      selectedPaymentIndex = index;
      widget.onPaymentSelected(name); // Call the callback
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0XFFACACAC)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: widget.paymentTypes.asMap().entries.map((entry) {
          final int index = entry.key;
          final PaymentTypeData paymentType = entry.value;

          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 33,
                decoration: BoxDecoration(
                  borderRadius: index == 0
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        )
                      : null, // Remove borderRadius for the first index
                  color: const Color(0XFFE7F7F9),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: Text(
                        paymentType.type,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: medium,
                            fontFamily: "Poppins"),
                      ),
                    ),
                    GestureDetector(
                      onTap: _openGuideModal,
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        width: 20,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/question.png"))),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  children: paymentType.data.map((paymentItem) {
                    String imagePath;
                    if (paymentType.type == "Coin") {
                      imagePath = "assets/images/coinNew.png";
                    } else if (paymentType.type == "Card") {
                      imagePath = "assets/images/card.png";
                    } else if (paymentType.type == "Store") {
                      imagePath = "assets/images/store.png";
                    } else {
                      // Default image or handle other cases
                      imagePath = "assets/images/coin.png";
                    }
                    return GestureDetector(
                      onTap: () {
                        _onPaymentTypeSelected(
                            paymentItem.id, paymentType.type);
                        print(paymentItem.id);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            width: 1,
                            color: selectedPaymentIndex == paymentItem.id
                                ? primary
                                : const Color(0XFFACACAC),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                if (paymentItem.name == "Coin")
                                  Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: primary),
                                        child: Center(
                                          child: Text(
                                            "C",
                                            style: TextStyle(
                                                color: whiteColor,
                                                fontSize: 16,
                                                fontWeight: semiBold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Available Coins",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: medium,
                                              fontFamily: "Poppins",
                                              color: greyColor,
                                            ),
                                          ),
                                          Text(
                                            "100 coins",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: medium,
                                              fontFamily: "Poppins",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                else
                                  Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          // borderRadius: BorderRadius.circular(100),
                                          image: DecorationImage(
                                            image: AssetImage(imagePath),
                                            colorFilter: selectedPaymentIndex ==
                                                    paymentItem.id
                                                ? ColorFilter.mode(
                                                    primary, BlendMode.srcIn)
                                                : ColorFilter.mode(
                                                    greyColor, BlendMode.srcIn),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        paymentItem.name,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: medium,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            if (selectedPaymentIndex == paymentItem.id)
                              Image.asset(
                                "assets/images/check.png",
                                width: 20,
                              )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}
