import 'package:flutter/material.dart';
import 'package:payment_module/event/model/event_model.dart';
import 'package:payment_module/event/styles/style.dart';

class FilterModalPrice extends StatefulWidget {
  const FilterModalPrice({Key? key}) : super(key: key);

  @override
  State<FilterModalPrice> createState() => _FilterModalPriceState();
}

class _FilterModalPriceState extends State<FilterModalPrice> {
  RangeValues _currentRangeValues = const RangeValues(300000, 7300000);

  TextEditingController startValuesController = TextEditingController();
  TextEditingController endValuesController = TextEditingController();

  void updateTextController(RangeValues values) {
    startValuesController.text = formatPrice(values.start, false);
    endValuesController.text = formatPrice(values.end, false);
  }

  @override
  void initState() {
    super.initState();
    startValuesController.text = formatPrice(_currentRangeValues.start, false);
    endValuesController.text = formatPrice(_currentRangeValues.end, false);

    //
    // startValuesController.addListener(_onStartValueChanged);
    // endValuesController.addListener(_onEndValueChanged);
  }

  // void _onStartValueChanged() {
  //   double startValue = toDouble(startValuesController.text);
  //   double endValue = toDouble(endValuesController.text);

  //   setState(() {
  //     _currentRangeValues = RangeValues(startValue, endValue);
  //   });
  // }

  // void _onEndValueChanged() {
  //   double startValue = toDouble(startValuesController.text);
  //   double endValue = toDouble(endValuesController.text);

  //   setState(() {
  //     _currentRangeValues = RangeValues(startValue, endValue);
  //   });
  // }

  // double toDouble(String value) {
  //   return double.parse(
  //     value.replaceAll(RegExp(r'[^0-9.]'), ''),
  //   );
  // }

  @override
  void dispose() {
    startValuesController.dispose();
    endValuesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.5, color: Colors.grey.withOpacity(0.3)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Price Range',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: subTitleFontSize),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: RangeSlider(
                activeColor: Colors.blue, // Change this to your desired color
                values: _currentRangeValues,
                min: 0,
                max: 10000000,
                divisions: 20,
                labels: RangeLabels(
                  formatPrice(_currentRangeValues.start, true),
                  formatPrice(_currentRangeValues.end, true),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    updateTextController(values);
                    _currentRangeValues = values;
                  });
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('From:'),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: SizedBox(
                    height: 32,
                    width: 106,
                    child: TextField(
                      enabled: false,
                      controller: startValuesController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefix: Text('Rp'),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                const Text('To:'),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: SizedBox(
                    height: 32,
                    width: 106,
                    child: TextField(
                      enabled: false,
                      controller: endValuesController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefix: Text('Rp'),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
