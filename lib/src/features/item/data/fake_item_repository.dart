import 'package:flutter/material.dart';
import 'package:flutter_qr_list/src/features/item/domain/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeItemsChangeNotifier extends ChangeNotifier {
  final List<Item> _items = [
    Item(id: 1, name: 'QR Name 1', code: 'codfdsafdsae'),
    Item(id: 2, name: 'QR Name 2', code: 'codfdsafdsafdsae'),
  ];

  List<Item> get items => _items;

  List<Item> getItemsList() {
    return _items;
  }

  Future<void> addItem(Item item) async {
    _items.add(item);
    notifyListeners();
  }

  Future<void> delItem(int id) async {
    _items.removeAt(id);
    notifyListeners();
  }
}

final itemProvider = ChangeNotifierProvider.autoDispose<FakeItemsChangeNotifier>((ref) => FakeItemsChangeNotifier());
