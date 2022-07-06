import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_qr_list/src/features/item/data/fake_item_repository.dart';
import 'package:flutter_qr_list/src/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

class ItemScreen extends ConsumerWidget {
  const ItemScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(itemProvider);
    final items = provider.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR list'),
        actions: [
          IconButton(
            onPressed: () {
              goRouter.go('/add_qr');
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => provider.delItem(index)),
              leading: QrImage(
                data: items[index].code.toString(),
                version: QrVersions.auto,
              ),
              title: Text(
                items[index].name.toString(),
              ),
              subtitle: Text(items[index].createAt == null
                  ? ''
                  : DateFormat.yMMMMd().format(DateTime.parse(items[index].createAt.toString()))),
            );
          },
          separatorBuilder: (context, i) => const Divider(),
        ),
      ),
    );
  }
}
