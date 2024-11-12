import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_project/provider/notifier_provider.dart';

class Test extends ConsumerStatefulWidget {
  const Test({super.key});

  @override
  ConsumerState<Test> createState() => TestState();
}

class TestState extends ConsumerState<Test> {
  int idLvl = 3;
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productNotifierProvider);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      appBar: AppBar(
        title: Text(
          products[products.length - 1],
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 81, 80, 80),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            idLvl += 1;
          });
          ref
              .read(productNotifierProvider.notifier)
              .addProduct(idLvl.toString());
        },
        child: const Icon(Icons.add),
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
              "Level",
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '$idLvl',
              style: const TextStyle(
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
            const SizedBox(
              height: 50.0,
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/quotes');
              },
              child: const Text('Go to Quotes'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/drawer');
              },
              child: const Text('Go to Drawer'),
            )
          ],
        ),
      ),
    );
  }
}
