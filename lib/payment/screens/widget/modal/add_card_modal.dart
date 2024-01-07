import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_module/payment/screens/widget/header/modal_header.dart';
import 'package:payment_module/payment/style/styles.dart';

class AddCardModal extends StatelessWidget {
  const AddCardModal({super.key});

  @override
  Widget build(BuildContext context) {
    bool _selectedValue = false; // Initially selected radio button value

    return Container(
      height: 670,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36), topRight: Radius.circular(36)),
        color: whiteColor,
      ),
      child: Column(
        children: [
          //HEADER
          const ModalHeader(
            title: "Card Attactment",
          ),
          //FORM
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Card Number",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: medium,
                            color: blackColor),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                        _CardNumberFormatter()
                      ],
                      decoration: InputDecoration(
                          hintText: "Card number",
                          prefixIcon: Container(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            margin: const EdgeInsets.only(right: 8),
                            child: Image.asset(
                              "assets/images/bca.png",
                              width: 44,
                            ),
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            width: double.infinity,
                            child: Text(
                              "Expiration date",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: medium,
                                  color: blackColor),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            width: double.infinity,
                            child: Text(
                              "CVC",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: medium,
                                  color: blackColor),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Alert
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        value: false,
                        groupValue: _selectedValue,
                        onChanged: (value) {},
                      ),
                      Text(
                        "Use this payment method for future purchase",
                        style: TextStyle(fontSize: 14, fontWeight: medium),
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 50)),
                    backgroundColor: MaterialStateProperty.all(primary),
                    // You can customize other button properties here
                  ),
                  child: Text(
                    "Add Card",
                    style: TextStyle(
                      fontWeight: medium,
                      fontSize: 14,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text =
        newValue.text.replaceAll(RegExp(r'\s'), ''); // Remove existing spaces
    var buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' '); // Add a space after every 4 digits
      }
      buffer.write(text[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
