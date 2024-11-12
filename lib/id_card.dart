import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_project/provider/dio_provider.dart';
import 'package:my_project/provider/product.dart';

class IdCard extends ConsumerWidget {
  const IdCard({super.key});

  void funTest() {
    print("data");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    final postsAsyncValue = ref.watch(postsProvider);

    void handleButtonPress() {
      // Your code here
      print('helllo');
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      appBar: AppBar(
        title: Text(
          products[0],
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 81, 80, 80),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/1.jpg'),
                radius: 40,
              ),
            ),
            const Divider(
              height: 90,
              color: Color.fromARGB(255, 61, 60, 60),
            ),
            const Text(
              "Name",
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Justin",
              style: TextStyle(
                  color: Colors.amberAccent,
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "ID",
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "3459049948693480",
              style: TextStyle(
                  color: Colors.amberAccent,
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "justin@gmail.com",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              // onPressed: () {
              //   GoRouter.of(context).push('/details/123');
              // },
              onPressed: handleButtonPress,
              child: const Text('Go to Details'),
            )
          ],
        ),
      ),
    );
  }
}
