import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

double minPriceFilter = 0;
double maxPriceFilter = 10000000;

String formatPrice(double? value, bool withCurrency) {
  return NumberFormat.currency(
    locale: 'id_ID',
    symbol: withCurrency ? 'Rp' : '',
    decimalDigits: 0,
  ).format(value);
}

String formatDate(DateTime date) {
  return DateFormat('dd MMM, yyyy').format(date);
}

String formatMinute(int value) {
  return value.toString().padLeft(2, '0');
}

String getCategoryName(int categoryId) {
  Category? category = categories.firstWhere(
    (cat) => cat.id == categoryId,
  );
  return category.name;
}

class Event {
  int id;
  String name;
  int categoryId;
  DateTime date;
  TimeOfDay startTime;
  TimeOfDay endTime;
  String imgUrl;
  double? price;

  Event({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.imgUrl,
    required this.price,
  });
}

List<Event> events = [
  Event(
    id: 1,
    name: 'Coldplay',
    categoryId: 1,
    date: DateTime(2022, 1, 15),
    startTime: const TimeOfDay(hour: 15, minute: 30),
    endTime: const TimeOfDay(hour: 18, minute: 0),
    imgUrl:
        'https://img.englishcinemakyiv.com/lMKund06dGBsKgVlW2ZcWyvt_uob__T_wSIh7ijYXxU/resize:fill:800:450:1:0/gravity:sm/aHR0cHM6Ly9leHBhdGNpbmVtYXByb2QuYmxvYi5jb3JlLndpbmRvd3MubmV0L2ltYWdlcy81NTQ0MGIzNC02Yzk1LTQ1ZTItOWJhNi1iOWM2OGI3ZjNiYzcuanBn.jpg',
    price: 5000000,
  ),
  Event(
    id: 2,
    name: 'Denpasar Festival',
    categoryId: 3,
    date: DateTime(2022, 2, 20),
    startTime: const TimeOfDay(hour: 18, minute: 0),
    endTime: const TimeOfDay(hour: 21, minute: 30),
    imgUrl:
        'https://denpasarfestival.id/wp-content/uploads/2023/12/Denfest23-Main-Logo.png',
    price: null,
  ),
  Event(
    id: 3,
    name: 'Tari Kecak Uluwatu',
    categoryId: 2,
    date: DateTime(2022, 3, 10),
    startTime: const TimeOfDay(hour: 20, minute: 0),
    endTime: const TimeOfDay(hour: 22, minute: 30),
    imgUrl:
        'https://atourin.obs.ap-southeast-3.myhuaweicloud.com/images/destination/badung/tari-kecak-uluwatu-profile1645584470.jpeg',
    price: 750000,
  ),
];

class Category {
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });
}

List<Category> categories = [
  Category(
    id: 1,
    name: 'Music',
  ),
  Category(
    id: 2,
    name: 'Culture',
  ),
  Category(
    id: 3,
    name: 'Official Events',
  ),
];

List<Category> moreFilters = [
  Category(
    id: 1,
    name: 'Upcoming Events',
  ),
  Category(
    id: 2,
    name: 'Nearest',
  ),
];

class ApiResponse {
  final List<String> age;
  final String minimum_person;
  final Map<String, dynamic> dos_donts;
  final List<String> requirement;

  ApiResponse({
    required this.age,
    required this.minimum_person,
    required this.dos_donts,
    required this.requirement,
  });
}

ApiResponse dummyApiResponse = ApiResponse(
  age: ['18-30', '31-50'],
  minimum_person: '1 person',
  dos_donts: {
    'dos': ['Lorem', 'Ipsum'],
    'donts': ['Avoid this', 'Never do that'],
  },
  requirement: ['Valid ID', 'Proof of address'],
);

class TncKeys {
  String age;
  String minimumPerson;
  String dosAndDonts;
  String dos;
  String donts;
  String rnr;
  String refundable;
  String reschedule;

  TncKeys(
      {required this.age,
      required this.minimumPerson,
      required this.dosAndDonts,
      required this.dos,
      required this.donts,
      required this.rnr,
      required this.refundable,
      required this.reschedule});
}

TncKeys tncKeys = TncKeys(
  age: 'Age',
  minimumPerson: 'Minimum Person',
  dosAndDonts: "Do's and Dont's",
  dos: "Do's",
  donts: "Dont's",
  rnr: 'Refundable and Reschedule Detail',
  refundable: 'Refundable',
  reschedule: 'Reschedule',
);

List<String> recentSearch = [
  'Coldplay',
  'Denpasar Festival',
  'Tari Kecak Uluwatu'
];
