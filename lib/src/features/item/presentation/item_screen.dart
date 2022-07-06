import 'package:flutter/material.dart';
import 'package:flutter_qr_list/src/features/item/data/fake_item_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR list'),
      ),
      body: Consumer(builder: (context, ref, child) {
        final itemProvider = ref.watch(itemsListFutureProvider);
        return itemProvider.when(
          data: (items) => ListView(
            children: items
                .map(
                  (item) => ListTile(
                    leading: QrImage(
                      data: item.code.toString(),
                      version: QrVersions.auto,
                    ),
                    title: Text(
                      item.name.toString(),
                    ),
                    subtitle:
                        Text(item.createAt == null ? '' : DateFormat('dMy').DateTime.parse(item.createAt.toString()).toString()),
                  ),
                )
                .toList(),
          ),
          error: (e, s) => const Text('Error'),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }),
    );
  }
}
