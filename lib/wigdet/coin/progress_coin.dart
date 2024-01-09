import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';

class ProgressCoinWidget extends StatefulWidget {
  const ProgressCoinWidget(
      {Key? key, required this.availableCoins, required this.coinUsed})
      : super(key: key);
  final double availableCoins;
  final double coinUsed; // Assume availableCoins is a percentage (0.0 to 1.0)

  @override
  State<ProgressCoinWidget> createState() => _ProgressCoinWidgetState();
}

class _ProgressCoinWidgetState extends State<ProgressCoinWidget> {
  double maxCoins = 1000000;

  @override
  Widget build(BuildContext context) {
    double progressValue =
        (widget.coinUsed / widget.availableCoins).clamp(0.0, 1.0);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.grey, // You can set the border color
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Available Coins',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: progressValue,
                minHeight: 10.0,
                backgroundColor: Color(0xFFE9E9E9),
                valueColor: AlwaysStoppedAnimation<Color>(primary),
                borderRadius: BorderRadius.circular(6.0),
              ),
              SizedBox(height: 8.0),
              SizedBox(
                width: double.infinity,
                child: Text(
                  ' ${widget.coinUsed.toInt()} / ${widget.availableCoins.toInt()} ',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff797979),
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
