import 'package:flutter/material.dart';
import 'package:payment_module/coin/barcode.dart';
import 'package:payment_module/event/event.dart';
import 'package:payment_module/home.dart';
import 'package:payment_module/payment/payment.dart';
import 'package:payment_module/ticket/transportation.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => const Home(),
        "/payment": (context) => const Payment(),
        "/transportation": (context) => const Transportation(),
        "/scan-qr": (context) => const QRViewExample(),
        "/event": (context) => const Event(),
      },
    );
  }
}
