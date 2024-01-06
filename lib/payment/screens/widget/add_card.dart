import 'package:flutter/material.dart';
import 'package:payment_module/payment/screens/widget/modal/card_list.dart';
import 'package:payment_module/payment/style/styles.dart';

class AddCardWidgets extends StatefulWidget {
  const AddCardWidgets({super.key});

  @override
  State<AddCardWidgets> createState() => _AddCardWidgetsState();
}

class _AddCardWidgetsState extends State<AddCardWidgets> {
  void _openCardListModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return CardList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Card Detail",
            style: TextStyle(
                fontSize: 16, fontWeight: semiBold, fontFamily: "Poppins"),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: _openCardListModal,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                      fontFamily: "Poppins",
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
