import 'package:flutter/material.dart';
import 'package:payment_module/event/model/event_model.dart';

// Create dummy data
ApiResponse dummyApiResponse = ApiResponse(
  age: ['18-30', '31-50'],
  minimum_person: '1 person',
  dos_donts: {
    'dos': ['Lorem', 'Ipsum'],
    'donts': ['Avoid this', 'Never do that'],
  },
  requirement: ['Valid ID', 'Proof of address'],
);

class DetailEventTnc extends StatelessWidget {
  const DetailEventTnc({super.key, required this.apiResponse});
  final ApiResponse apiResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildKeyValueWidget('Age', apiResponse.age.join(', ')),
        _buildKeyValueWidget('Minimum Person', apiResponse.minimum_person),
        _buildDosDontsWidget(apiResponse.dos_donts),
        _buildKeyValueWidget(
            'Requirements', apiResponse.requirement.join(', ')),
      ],
    );
  }

  Widget _buildDosDontsWidget(Map<String, dynamic> dosDonts) {
    List<String> dosList = (dosDonts['dos'] as List).cast<String>();
    List<String> dontsList = (dosDonts['donts'] as List).cast<String>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildKeyValueWidget('Do\'s and Dont\'s', ''),
        _buildSubDosDontsWidget('Do\'s', dosList),
        _buildSubDosDontsWidget('Dont\'s', dontsList),
      ],
    );
  }

  Widget _buildSubDosDontsWidget(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildKeyValueWidget(title, ''),
        ...items.asMap().entries.map((entry) {
          int index = entry.key + 1;
          String item = entry.value;
          return _buildListItem(index, item);
        }).toList(),
      ],
    );
  }

  Widget _buildListItem(int index, String item) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text('$index. $item'),
    );
  }

  Widget _buildKeyValueWidget(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(content),
        ],
      ),
    );
  }
}
