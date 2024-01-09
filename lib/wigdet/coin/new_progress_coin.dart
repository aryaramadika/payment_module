import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';
import 'package:payment_module/wigdet/coin/progress_coin.dart';

class NewProgressCoinWidget extends StatefulWidget {
  const NewProgressCoinWidget({
    Key? key,
    required this.availableCoins,
    required this.coinUsed,
  }) : super(key: key);

  final double availableCoins;
  final double coinUsed; // Assume availableCoins is a percentage (0.0 to 1.0)

  @override
  State<NewProgressCoinWidget> createState() => _NewProgressCoinWidgetState();
}

class _NewProgressCoinWidgetState extends State<NewProgressCoinWidget> {
  double maxCoins = 1000000;

  @override
  Widget build(BuildContext context) {
    double progressValue =
        (widget.coinUsed / widget.availableCoins).clamp(0.0, 1.0);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available Coins',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.blue),
                        child: const Center(
                          child: Text(
                            "C",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          height: 10.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6.0),
                              bottomRight: Radius.circular(6.0),
                            ),
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 10.0,
                          width: progressValue * 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            child: Positioned(
              left: progressValue * 100.0 - 4.0,
              bottom: 0,
              // top: 23,
              child: Column(
                children: [
                  ClipPath(
                    clipper: TriangleClipper(),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      color: primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0.0) // Move to the top center
      ..lineTo(0.0, size.height) // Line to the bottom left
      ..lineTo(size.width, size.height) // Line to the bottom right
      ..close(); // Close the path to create a triangle

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
