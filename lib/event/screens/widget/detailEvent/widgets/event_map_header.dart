import 'package:flutter/material.dart';
import 'package:payment_module/event/styles/style.dart';

class EventMapHeader extends StatelessWidget {
  const EventMapHeader({super.key});

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
            const SizedBox(
              width: 48,
            )
          ],
        ),
      ),
    );
  }
}
