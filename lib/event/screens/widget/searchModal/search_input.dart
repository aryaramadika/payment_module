import 'package:flutter/material.dart';
import 'package:payment_module/event/styles/style.dart';

class SearchInput extends StatelessWidget {
  const SearchInput(
      {super.key, required TextEditingController this.inputController});

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: searchBackgroundColor,
        border: Border.all(color: borderColor, width: 1),
      ),
      child: SizedBox(
        height: 42,
        child: TextField(
          controller: inputController,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: secondary,
            ),
            hintText: 'Search for an event',
            hintStyle: TextStyle(color: secondary, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
