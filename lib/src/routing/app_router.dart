import 'package:flutter_qr_list/src/features/item/presentation/item_add_qr/item_add_name_widget.dart';
import 'package:flutter_qr_list/src/features/item/presentation/item_add_qr/item_add_qr_widget.dart';
import 'package:flutter_qr_list/src/features/item/presentation/item_screen/item_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  addQr,
  addName,
}

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const ItemScreen(),
      routes: [
        GoRoute(
          path: 'add_qr',
          name: AppRoute.addQr.name,
          builder: (context, state) => const AddQRWidget(),
        ),
        GoRoute(
          path: 'add_name',
          name: AppRoute.addName.name,
          builder: (context, state) => const ItemAddNameWidget(),
        ),
      ],
    ),
  ],
);
