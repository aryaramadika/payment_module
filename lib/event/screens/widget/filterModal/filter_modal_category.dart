import 'package:flutter/material.dart';
import 'package:payment_module/event/model/event_model.dart';
import 'package:payment_module/event/styles/style.dart';
// Import the Category class and the categories list

class FilterModalCategory extends StatefulWidget {
  const FilterModalCategory({super.key});

  @override
  State<FilterModalCategory> createState() => _FilterModalCategoryState();
}

class _FilterModalCategoryState extends State<FilterModalCategory> {
  List<int> selectedCategories = []; // List to store selected category IDs

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.5, color: Colors.grey.withOpacity(0.3)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Category',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            ...categories.map(
              (item) => SizedBox(
                child: SizedBox(
                  height: 36,
                  child: CheckboxListTile(
                    tileColor: secondary,
                    side: BorderSide(color: secondary),
                    contentPadding: EdgeInsets.zero,
                    activeColor: primary,
                    title: Transform.translate(
                      offset: const Offset(-20, 0),
                      child: Text(
                        item.name,
                        style: TextStyle(color: secondary),
                      ),
                    ),
                    value: selectedCategories.contains(item.id),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) {
                          if (value) {
                            selectedCategories.add(item.id);
                          } else {
                            selectedCategories.remove(item.id);
                          }
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
