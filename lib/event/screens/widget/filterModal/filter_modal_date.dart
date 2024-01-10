import 'package:flutter/material.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:payment_module/event/model/event_model.dart';
import 'package:payment_module/event/styles/style.dart';

class FilterModalDate extends StatefulWidget {
  const FilterModalDate({super.key});

  @override
  State<FilterModalDate> createState() => _FilterModalDateState();
}

class _FilterModalDateState extends State<FilterModalDate> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 1));

  Future<void> _selectDateRange(BuildContext context) async {
    final now = DateTime.now();
    final maxDate = DateTime.now().add(const Duration(days: 365));
    showCustomDateRangePicker(
      context,
      dismissible: true,
      minimumDate: now,
      maximumDate: maxDate,
      endDate: endDate,
      startDate: startDate,
      backgroundColor: Colors.white,
      primaryColor: primary,
      onApplyClick: (start, end) {
        setState(() {
          endDate = end;
          startDate = start;
        });
      },
      onCancelClick: () {},
    );
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
              child: const Text(
                'Date Range',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: inputBorderColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${formatDate(startDate)} - ${formatDate(endDate)}',
                    style: TextStyle(fontSize: 16, color: secondary),
                  ),
                  SizedBox(
                    height: 16,
                    width: 16,
                    child: IconButton(
                      iconSize: 16,
                      padding: EdgeInsets.zero,
                      onPressed: () => _selectDateRange(context),
                      icon: const Icon(
                        Icons.date_range_outlined,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
