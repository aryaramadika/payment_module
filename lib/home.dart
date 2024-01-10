import 'package:flutter/material.dart';
import 'package:payment_module/coin/barcode.dart';
import 'package:payment_module/payment/model/billing_model.dart';
import 'package:payment_module/payment/payment.dart';
import 'package:payment_module/payment/screens/widget/header/header.dart';
import 'package:payment_module/payment/screens/widget/steps.dart';
import 'package:payment_module/payment/style/styles.dart';
import 'package:payment_module/wigdet/coin/new_progress_coin.dart';
import 'package:payment_module/wigdet/coin/progress_coin.dart';
import 'package:payment_module/wigdet/coin/redeem_guide.dart';
import 'package:payment_module/wigdet/guide_modal.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? barcodeDatas;

  void initState() {
    super.initState();
    if (barcodeDatas != null) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctx) {
          return const RedeemModal();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    void _handleScannedData(String? scannedData) {
      print("sccamed :$scannedData");
      setState(() {
        barcodeDatas = scannedData;
      });
    }

    void _openRedeemModal() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctx) {
          return const RedeemModal();
        },
      );
    }

    List<BillingDetail> dummyBillingList = [
      BillingDetail(
        name: "Basic Fee",
        amount: 200000,
      ),
      BillingDetail(
        name: "Delivery Fee",
        amount: 200000,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('${barcodeDatas ?? "Upload"}'),
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
                              arguments: PaymentArguments(
                                  const Header(),
                                  const StepsWidget(),
                                  "/",
                                  1000000,
                                  dummyBillingList)),
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

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => QRViewExample(),
                      //   ),
                      // );
                    },
                    child: Text("Scan QR"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _openRedeemModal();
                },
                child: Text(
                  "Show Modal Sheet",
                  style: TextStyle(color: whiteColor),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
