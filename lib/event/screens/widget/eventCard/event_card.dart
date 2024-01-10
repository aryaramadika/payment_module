import 'package:flutter/material.dart';
import 'package:payment_module/event/model/event_model.dart';
import 'package:payment_module/event/styles/style.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.3),
      margin: const EdgeInsets.only(bottom: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          // First Row: Image
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              color: const Color.fromARGB(255, 242, 242, 242),
              image: DecorationImage(
                image: NetworkImage(event.imgUrl),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.date_range_rounded,
                          color: secondary,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          formatDate(event.date),
                          style: TextStyle(
                              color: secondary, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: secondary,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${event.startTime.hour}:${formatMinute(event.startTime.minute)} - ${event.endTime.hour}:${formatMinute(event.endTime.minute)}',
                          style: TextStyle(
                              color: secondary, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.apps,
                      color: secondary,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      getCategoryName(event.categoryId),
                      style: TextStyle(
                          color: secondary, fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 30,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
              color: event.price == null ? primary : paidColor,
            ),
            child: Center(
              child: Text(
                event.price == null
                    ? 'Free Entrance'
                    : formatPrice(event.price, true),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
