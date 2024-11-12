// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/id_card.dart';
import 'package:my_project/router.dart';
// void main() {
//   runApp(const MaterialApp(home: QuoState()));
// }
import 'package:flutter/material.dart';
import 'package:my_project/test.dart';
import 'package:my_project/test_dio.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: PostsScreen())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Step 3: Define GoRouter configuration
  // final GoRouter _router = GoRouter(
  //   routes: [
  //     GoRoute(
  //       path: '/',
  //       name: 'home',
  //       builder: (context, state) => const Test(),
  //     ),
  //     GoRoute(
  //       path: '/quotes',
  //       name: 'details',
  //       builder: (context, state) {
  //         // final id = state.pathParameters['id']!; // Using null assertion
  //         return const QuoState();
  //       },
  //     ),
  //     GoRoute(
  //       path: '/drawer',
  //       name: 'drawer',
  //       builder: (context, state) {
  //         return const DrawerW();
  //       },
  //     ),
  //   ],
  // );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             context.push('/details/123'); // Navigate with parameter
//           },
//           child: const Text('Go to Details'),
//         ),
//       ),
//     );
//   }
// }

// class DetailsScreen extends StatelessWidget {
//   final String id;

//   const DetailsScreen({super.key, required this.id});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Details')),
//       body: Center(
//         child: Text('Detail ID: $id'),
//       ),
//     );
//   }
// }

//Quote
// class QuoState extends StatefulWidget {
//   const QuoState({super.key});

//   @override
//   State<QuoState> createState() => QuoStateState();
// }

// class QuoStateState extends State<QuoState> {
//   List<Quotes> quotes = [
//     Quotes(name: 'Name', text: 'This is text 1'),
//     Quotes(name: 'Name', text: 'This is text 2'),
//     Quotes(name: 'Name', text: 'This is text 3'),
//     Quotes(name: 'Name', text: 'This is text 4'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         title: const Text("Quotes"),
//         centerTitle: true,
//         backgroundColor: Colors.redAccent,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             context.pop(); // Use context.pop() to navigate back
//           },
//         ),
//       ),
//       body: Column(
//           children: quotes
//               .map((quote) => QuoteWidget(
//                     quote: quote,
//                     delete: () {
//                       setState(() {
//                         quotes.remove(quote);
//                       });
//                     },
//                   ))
//               .toList()),
//     );
//   }
// }
