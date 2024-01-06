enum PaymentType { coin, card, store }

const typeIcons = {
  PaymentType.coin: "assets/images/coinNew.png",
  PaymentType.card: "assets/images/card.png",
  PaymentType.store: "assets/images/store.png"
};

class PaymentTypeData {
  final String type;
  final List<PaymentTypeItem> data;

  PaymentTypeData({
    required this.type,
    required this.data,
  });

  @override
  String toString() {
    return 'Type: $type, Data: $data';
  }
}

class PaymentTypeItem {
  final String name;
  final String icon;
  final String id;

  PaymentTypeItem({required this.name, required this.icon, required this.id});

  @override
  String toString() {
    return 'Name: $name, Icon: $icon';
  }
}
