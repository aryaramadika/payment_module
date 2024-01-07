import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/payment');
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
            )
          ],
        ),
      ),
    );
  }
}
