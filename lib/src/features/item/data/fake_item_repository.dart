import 'package:flutter_qr_list/src/features/item/domain/item.dart';
import 'package:flutter_qr_list/src/utils/delay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeItemsRepository {
  FakeItemsRepository({this.addDelay = true});
  final bool addDelay;
  final List<Item> _products = [
    Item(id: 1, name: 'QR Name 1', code: 'codfdsafdsae', createAt: DateTime.now()),
  ];

  List<Item> getItemsList() {
    return _products;
  }

  Item? getItem(String id) {
    return _getItem(_products, id);
  }

  Future<List<Item>> fetchProductsList() async {
    await delay(addDelay);
    return Future.value(_products);
  }

  Future<Item?> fetchProduct(id) async {
    List<Item> items = await fetchProductsList();
    return _getItem(items, id);
  }

  // Stream<List<Item>> watchProductsList() async* {
  //   await delay(addDelay);
  //   yield _products;
  // }

  // Stream<Item?> watchProduct(String id) {
  //   return watchProductsList().map((products) => _getItem(products, id));
  // }

  static Item? _getItem(List<Item> items, String id) {
    try {
      return items.firstWhere((item) => item.id.toString() == id);
    } catch (e) {
      return null;
    }
  }
}

final itemRepositoryProvider = Provider<FakeItemsRepository>((ref) {
  return FakeItemsRepository(addDelay: false);
});

final itemsListFutureProvider = FutureProvider.autoDispose<List<Item>>((ref) {
  final productsRepository = ref.watch(itemRepositoryProvider);
  return productsRepository.fetchProductsList();
});

// final itemProvider = StreamProvider.autoDispose.family<Item?, String>((ref, id) {
//   final productsRepository = ref.watch(itemRepositoryProvider);
//   return productsRepository.watchProduct(id);
// });

final itemProvider = FutureProvider.autoDispose.family<Item?, String>((ref, id) {
  final itemsRepository = ref.watch(itemRepositoryProvider);
  return itemsRepository.fetchProduct(id);
});
