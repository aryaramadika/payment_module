import 'package:flutter/material.dart';
import 'package:payment_module/event/screens/widget/filterModal/filter_modal_category.dart';
import 'package:payment_module/event/screens/widget/filterModal/filter_modal_date.dart';
import 'package:payment_module/event/screens/widget/filterModal/filter_modal_header.dart';
import 'package:payment_module/event/screens/widget/filterModal/filter_modal_more.dart';
import 'package:payment_module/event/screens/widget/filterModal/filter_modal_price.dart';

class FilterModal extends StatefulWidget {
  const FilterModal(
      {super.key, required this.clearFilter, required this.getEventList});

  final void Function() clearFilter;
  final void Function() getEventList;

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.90,
            color: Colors.white,
            child: Column(
              children: [
                FilterModalHeader(clearFilter: widget.clearFilter),
                const FilterModalPrice(),
                const FilterModalDate(),
                const FilterModalCategory(),
                const FilterModalMore(),
              ],
            )),
      ],
    );
  }
}
