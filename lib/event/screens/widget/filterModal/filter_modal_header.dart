import 'package:flutter/material.dart';
import 'package:payment_module/event/styles/style.dart';

class FilterModalHeader extends StatelessWidget {
  const FilterModalHeader({super.key, required this.clearFilter});

  final void Function() clearFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primary,
      ),
      // first child
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0, top: 12, right: 12, left: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            Text(
              'Filter',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: titleFontSize),
            ),
            IconButton(
              onPressed: clearFilter,
              icon: const Icon(Icons.refresh, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
