class Item {
  final int id;
  final String? name;
  final String code;
  final DateTime createAt = DateTime.now();
  final DateTime? updateAt;

  Item({
    required this.id,
    this.name,
    required this.code,
    this.updateAt,
  });
}
