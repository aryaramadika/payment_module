import 'package:flutter/material.dart';
import 'package:payment_module/event/model/event_model.dart';
import 'package:payment_module/event/screens/widget/searchModal/event_card_search_modal.dart';
import 'package:payment_module/event/screens/widget/searchModal/search_input.dart';
import 'package:payment_module/event/screens/widget/searchModal/search_modal_header.dart';
import 'package:payment_module/event/styles/style.dart';

class SearchModal extends StatefulWidget {
  const SearchModal({super.key});

  @override
  State<SearchModal> createState() => _SearchModal();
}

class _SearchModal extends State<SearchModal> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.85,
            color: Colors.white,
            child: Column(
              children: [
                const SearchModalHeader(),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SearchInput(inputController: searchController),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              'Recent Search',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ),
                          ...recentSearch.map(
                            (item) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item,
                                    style: TextStyle(
                                        color: secondary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.close,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Available Searches',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          // add list view builder here
                          SizedBox(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: events.length,
                              itemBuilder: (context, index) {
                                return EventCardSearchModal(
                                    event: events[index]);
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
