import 'package:go_router/go_router.dart';
import 'package:my_project/drawer.dart';
import 'package:my_project/quote.dart';
import 'package:my_project/test.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const Test(),
    ),
    GoRoute(
      path: '/quotes',
      name: 'details',
      builder: (context, state) {
        // final id = state.pathParameters['id']!; // Using null assertion
        return const QuoState();
      },
    ),
    GoRoute(
      path: '/drawer',
      name: 'drawer',
      builder: (context, state) {
        return const DrawerW();
      },
    ),
  ],
);
