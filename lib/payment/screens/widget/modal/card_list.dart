import 'package:flutter/material.dart';
import 'package:payment_module/payment/screens/widget/header/modal_header.dart';
import 'package:payment_module/payment/screens/widget/modal/add_card_modal.dart';
import 'package:payment_module/payment/style/styles.dart';

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  void _openAddCardModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return const AddCardModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
            title: "Card Attactment",
          ),
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "No Card Attachment Found",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: semiBold,
                          color: blackColor),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                      onTap: _openAddCardModal,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            width: 1,
                            color: const Color(0XFFACACAC),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: primary,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Attached Card Detail",
                              style: TextStyle(
                                  fontWeight: medium,
                                  fontSize: 16,
                                  color: blackColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
