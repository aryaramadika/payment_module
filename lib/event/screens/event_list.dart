import 'package:flutter/material.dart';
import 'package:payment_module/event/model/event_model.dart';
import 'package:payment_module/event/screens/widget/eventCard/event_card.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return EventCard(event: events[index]);
      },
    );
  }
}
