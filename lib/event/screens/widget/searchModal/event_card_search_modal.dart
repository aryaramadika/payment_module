import 'package:flutter/material.dart';
import 'package:payment_module/event/model/event_model.dart';
import 'package:payment_module/event/styles/style.dart';

class EventCardSearchModal extends StatelessWidget {
  const EventCardSearchModal({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            event.imgUrl,
            fit: BoxFit.cover,
            width: 70.0,
            height: 70.0,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
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
      ],
    );
  }
}
