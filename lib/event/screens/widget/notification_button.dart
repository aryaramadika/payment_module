import 'package:flutter/material.dart';

class NotificationButton extends StatefulWidget {
  const NotificationButton({super.key});

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  int totalNotifications = 100;
  // Future<int> totalNotifications;

  // @override
  // void initState() {
  //   super.initState();
  //   totalNotifications = getTotalNotifications();
  // }

  // Future<int> getTotalNotifications() async {
  //   // adam please remember to get the total notifications
  //   return 100;
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        IconButton(
          iconSize: 24,
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {
            // Add your logic to handle the button press
            // For example, show a notification dialog or navigate to a notifications page.
          },
        ),
        if (totalNotifications > 0) ...[
          Positioned(
            top: 8.0,
            right: 8.0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                totalNotifications > 99 ? '99+' : '$totalNotifications',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 7,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
