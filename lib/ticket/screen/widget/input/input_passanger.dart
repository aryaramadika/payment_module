import 'package:flutter/material.dart';
import 'package:payment_module/payment/style/styles.dart';

class InputPassanger extends StatefulWidget {
  const InputPassanger({Key? key, required this.numOfPassanger})
      : super(key: key);

  final int numOfPassanger;

  @override
  State<InputPassanger> createState() => _InputPassangerState();
}

class _InputPassangerState extends State<InputPassanger> {
  late int _currentNumOfPassenger;

  @override
  void initState() {
    super.initState();
    _currentNumOfPassenger = widget.numOfPassanger;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Number of Passengers",
          style: TextStyle(
              fontWeight: medium,
              fontSize: 14,
              fontFamily: "Poppins",
              color: greyColor),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              color: primary,
              onPressed: () {
                setState(() {
                  _currentNumOfPassenger =
                      (_currentNumOfPassenger - 1).clamp(0, 999);
                });
              },
            ),
            Container(
              width: 34,
              height: 24,
              child: TextField(
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                controller: TextEditingController(
                    text: _currentNumOfPassenger.toString()),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _currentNumOfPassenger = int.parse(value);
                  });
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              color: primary,
              onPressed: () {
                setState(() {
                  _currentNumOfPassenger =
                      (_currentNumOfPassenger + 1).clamp(0, 999);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
