import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_qr_list/src/features/item/domain/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemAddQRController extends ChangeNotifier {
  Item _item = Item(id: Random().nextInt(100), code: '');

  Item get item => _item;

  Future<void> setItem(Item item) async {
    _item = item;
    notifyListeners();
  }

  Future<void> setItemCode(String code) async {
    _item = Item(id: _item.id, code: _item.code);
  }

  Future<void> setItemName(String name) async {
    _item = Item(id: _item.id, code: _item.code, name: name);
  }

  Future<void> reset() async {
    _item = Item(id: Random().nextInt(100), code: '');
  }
}

final itemAddQRController = ChangeNotifierProvider.autoDispose<ItemAddQRController>((ref) => ItemAddQRController());
