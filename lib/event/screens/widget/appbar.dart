import 'package:flutter/material.dart';
import 'package:payment_module/event/screens/widget/notification_button.dart';
import 'package:payment_module/event/styles/style.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key, required this.pageTitle});

  final String pageTitle;

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: primary),
      padding: const EdgeInsets.fromLTRB(20, 80, 20, 8),
      child: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 40,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  widget.pageTitle,
                  style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 40,
              height: 40,
              child: NotificationButton(),
            )
          ],
        ),
      ),
    );
  }
}
