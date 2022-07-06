import 'package:flutter/material.dart';
import 'package:flutter_qr_list/src/features/item/data/fake_item_repository.dart';
import 'package:flutter_qr_list/src/features/item/presentation/item_add_qr/item_add_qr_controller.dart';
import 'package:flutter_qr_list/src/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemAddNameWidget extends ConsumerStatefulWidget {
  const ItemAddNameWidget({Key? key}) : super(key: key);

  @override
  ItemAddNameWidgetState createState() => ItemAddNameWidgetState();
}

class ItemAddNameWidgetState extends ConsumerState<ItemAddNameWidget> {
  final TextEditingController _nameCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final itemAddQRCon = ref.read(itemAddQRController);
    final itemsCon = ref.read(itemProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: TextField(
                controller: _nameCon,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: OutlinedButton(
                onPressed: () async {
                  await itemAddQRCon.setItemName(_nameCon.text);
                  await itemsCon.addItem(itemAddQRCon.item);
                  await itemAddQRCon.reset();
                  goRouter.go('/');
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
