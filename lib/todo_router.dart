import 'package:go_router/go_router.dart';
import 'package:my_project/drawer.dart';
import 'package:my_project/liststodo.dart';
import 'package:my_project/quote.dart';
import 'package:my_project/text_textfield.dart';

GoRouter todoRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const InputExample(),
    ),
    GoRoute(
      path: '/list/:username',
      name: 'details',
      builder: (context, state) {
        final username =
            state.pathParameters['username']!; // Using null assertion
        return Liststodo(
          username: username,
        );
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
