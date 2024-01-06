import 'package:flutter/material.dart';
import 'package:payment_module/payment/payment.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Payment(),
    );
  }
}
