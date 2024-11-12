import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_project/Model/user_data.dart';
import 'package:my_project/provider/input_provider.dart';

class InputExample extends ConsumerStatefulWidget {
  const InputExample({super.key});

  @override
  ConsumerState createState() => InputExampleState();
}

class InputExampleState extends ConsumerState<InputExample> {
  // Controller to handle the input text
  final TextEditingController _controller = TextEditingController();

  bool isText = false;

  action(cont) {
    ref.read(inputNotiProvider.notifier).addProduct(_controller.text);
    GoRouter.of(context).go('/list/${_controller.text}');
    _controller.text = '';
    Navigator.pop(cont);
  }

  cancel(context) {
    Navigator.pop(context);
  }

  // Function to handle button press
  void _showInput() {
    String inputText = _controller.text;
    // Show dialog or use the input as needed
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Username"),
        content: Text(inputText),
        actions: [
          TextButton(
            onPressed: () {
              action(context);
            },
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () {
              cancel(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                if (text.isNotEmpty) {
                  setState(() {
                    isText = true;
                  });
                } else {
                  setState(() {
                    isText = false;
                  });
                }
              },
              controller: _controller, // Link the controller to the TextField
              decoration: const InputDecoration(
                labelText: 'Enter Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isText ? _showInput : null,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
