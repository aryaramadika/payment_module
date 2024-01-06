import 'package:flutter/material.dart';
import 'package:payment_module/payment/model/payment_model.dart';
import 'package:payment_module/payment/screens/widget/add_card.dart';
import 'package:payment_module/payment/screens/widget/billing_info.dart';
import 'package:payment_module/payment/screens/widget/button/button.dart';
import 'package:payment_module/payment/screens/widget/payment_method.dart';
import 'package:payment_module/payment/screens/widget/voucher_widget.dart';
import 'package:payment_module/payment/style/styles.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.widgets});

  final Widget widgets;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isButtonDisabled = true;
  String selectedPaymentMethod = ''; // Track the selected payment method

  bool _selectedValue = false; // Initially selected radio button value

  //Note: Dummy Payment
  List<PaymentTypeData> paymentTypes = [
    PaymentTypeData(
      type: "Coin",
      data: [
        PaymentTypeItem(
          id: "1",
          name: "Coin",
          icon: typeIcons[PaymentType.coin].toString(),
        ),
      ],
    ),
    PaymentTypeData(
      type: "Card",
      data: [
        PaymentTypeItem(
          id: "2",
          name: "Debit/Credit Card",
          icon: typeIcons[PaymentType.card].toString(),
        ),
      ],
    ),
    PaymentTypeData(
      type: "Store",
      data: [
        PaymentTypeItem(
          id: "3",
          name: "Alfamart",
          icon: typeIcons[PaymentType.store].toString(),
        ),
        PaymentTypeItem(
          id: "4",
          name: "Indomart",
          icon: typeIcons[PaymentType.store].toString(),
        ),
      ],
    ),
  ];

  // Function to handle the selected payment method
  void handlePaymentMethod(String paymentMethod) {
    setState(() {
      print(paymentMethod == 'Card');
      selectedPaymentMethod = paymentMethod;
      if (selectedPaymentMethod != "") {
        print("selected payment $selectedPaymentMethod");
        isButtonDisabled = false;
      } else {
        isButtonDisabled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(color: primary),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
            color: whiteColor,
          ),
          child: Column(
            children: [
              //Note: TITLE PAYMENT
              widget.widgets,

              //Note: vouchers
              const VouchersWidget(),

              //Note: Payment Method
              PaymentMethodWidget(
                listPayments: paymentTypes,
                onPaymentSelected: handlePaymentMethod,
              ),

              //Note: Add Card Button or Radio Widget
              selectedPaymentMethod == 'Card'
                  ? const AddCardWidgets()
                  : Column(
                      children: <Widget>[
                        ListTile(
                          title: const Text(
                              'Use this payment method for future purchase'),
                          leading: Radio(
                            value: true,
                            groupValue: _selectedValue ? null : false,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = !_selectedValue;
                                print('selected $_selectedValue $value');
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
              const SizedBox(height: 12),

              //NOTE: Purchase Button
              ButtonWidget(
                isButtonDisabled: isButtonDisabled,
                title: "Purchase",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
