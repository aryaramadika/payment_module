import 'package:flutter/material.dart';
import 'package:payment_module/payment/payment.dart';
import 'package:payment_module/payment/screens/widget/header/header.dart';
import 'package:payment_module/payment/screens/widget/steps.dart';
import 'package:payment_module/payment/style/styles.dart';
import 'package:payment_module/wigdet/coin/new_progress_coin.dart';
import 'package:payment_module/wigdet/coin/progress_coin.dart';
import 'package:payment_module/wigdet/coin/redeem_guide.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              RedeemGuide(),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                  child: ProgressCoinWidget(
                    availableCoins: 150000,
                    coinUsed: 10000,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Payment(),
                          // Pass the arguments as part of the RouteSettings. The
                          // DetailScreen reads the arguments from these settings.
                          settings: RouteSettings(
                            arguments: PaymentArguments(const Header(),
                                const StepsWidget(), "/", 1000000),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Payment",
                      style: TextStyle(color: whiteColor),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primary),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/transportation');
                    },
                    child: Text("Ticket"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/scan-qr');
                    },
                    child: Text("Scan QR"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
