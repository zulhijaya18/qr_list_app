import 'package:flutter_qr_list/src/features/item/presentation/item_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home }

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: AppRoute.home.name, builder: (context, state) => const ItemScreen()),
  ],
);
