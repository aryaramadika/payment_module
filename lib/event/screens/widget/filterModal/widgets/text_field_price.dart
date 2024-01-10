import 'package:flutter/material.dart';

class TextFieldPrice extends StatefulWidget {
  const TextFieldPrice({
    super.key,
    required this.valueController,
  });

  final TextEditingController valueController;

  @override
  State<TextFieldPrice> createState() => _TextFieldPriceState();
}

class _TextFieldPriceState extends State<TextFieldPrice> {
  double toDouble(String value) {
    return double.parse(
      value.replaceAll(RegExp(r'[^0-9.]'), ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 14),
      controller: widget.valueController,
      decoration: const InputDecoration(
          prefix: Text('Rp'),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 0)),
    );
  }
}
