import 'package:flutter/material.dart';

class SBExample extends StatelessWidget {
  const SBExample({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Ensure that the Scaffold is available before calling showSnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Item deleted'),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    // Perform an undo action
                    print('Undo action performed');
                  },
                ),
                duration: const Duration(seconds: 3),
              ),
            );
          },
          child: const Text('Show Snackbar'),
        ),
      ),
    );
  }
}
