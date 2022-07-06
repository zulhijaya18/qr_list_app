class Item {
  final int id;
  final String name;
  final String code;
  final DateTime? createAt;
  final DateTime? updateAt;

  Item({
    required this.id,
    required this.name,
    required this.code,
    this.createAt,
    this.updateAt,
  });
}
