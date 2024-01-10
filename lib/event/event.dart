import 'package:flutter/material.dart';
import 'package:payment_module/event/screens/widget/appbar.dart';
import 'package:payment_module/event/screens/widget/detailEvent/detail_event_gallery.dart';
import 'package:payment_module/event/screens/widget/filterModal/filter_modal.dart';
import 'package:payment_module/event/styles/style.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  TextEditingController searchController = TextEditingController();
  var activeScreen = 'main';

  void switchScreen() {}

  void clearFilter() {
    // adam remove filter state tulul
  }

  void getEventList() {
    // please get the event list adam
  }

  void _openFilterOverlay() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
        ),
        builder: (ctx) => FilterModal(
              clearFilter: clearFilter,
              getEventList: getEventList,
            ));
  }

  // void _openLocationOverlay() {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     clipBehavior: Clip.antiAlias,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(36),
  //         topRight: Radius.circular(36),
  //       ),
  //     ),
  //     builder: (context) => const DetailEventMap(
  //       latitude: -8.663942745929369,
  //       longitude: 115.2350960400886,
  //       address: "Jl. Lorem Ipsum",
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Appbar(pageTitle: 'Events'),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: searchBackgroundColor,
                      border: Border.all(color: borderColor, width: 1),
                    ),
                    child: SizedBox(
                      height: 42,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: secondary,
                          ),
                          hintText: 'Search for an event',
                          hintStyle: TextStyle(
                              color: secondary, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Events',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: subTitleFontSize),
                      ),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: IconButton(
                          iconSize: 32,
                          padding: EdgeInsets.zero,
                          onPressed: _openFilterOverlay,
                          icon: const Icon(
                            Icons.tune,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    // child: EventList(),
                    child: DetailEventGallery(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
