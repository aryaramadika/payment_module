import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';
import 'package:payment_module/wigdet/button/button.dart';

class RedeemGuide extends StatefulWidget {
  const RedeemGuide({super.key});

  @override
  State<RedeemGuide> createState() => _RedeemGuideState();
}

class _RedeemGuideState extends State<RedeemGuide> {
  final List<String> steps = [
    'Open PEMDA App',
    'Scan QR code to redeem coin',
    'Purchase all product using your coin!',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Redeem your coin now!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: semiBold,
              color: secondGreyColor,
            ),
          ),
          SizedBox(height: 10),
          NumberedList(items: steps),
          SizedBox(height: 12),
          ButtonRedeemWidget(
              isButtonDisabled: false,
              title: "Redeem Coin",
              paddinHorizontal: 0,
              paddingVertical: 0)
        ],
      ),
    );
  }
}

class NumberedList extends StatelessWidget {
  final List<String> items;

  NumberedList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 16.25,
                width: 16.25,
                // padding: EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: semiBold,
                      color: whiteColor,
                      // fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  items[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: regular,
                    color: Color(0xff797979),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
