import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_project/Model/todo.dart';
import 'package:my_project/Model/user_data.dart';

class Liststodo extends StatefulWidget {
  const Liststodo({super.key, required this.username});

  final String username;

  // Constructor to accept the userId parameter

  @override
  State<Liststodo> createState() => _ListState();
}

class _ListState extends State<Liststodo> {
  List<Todo> arr = [
    Todo(text: 'List 1', status: false),
    Todo(text: "List 2", status: false)
  ];

  final TextEditingController _controller = TextEditingController();

  void addTodos() {
    // String inputText = _controller.text;
    // Show dialog or use the input as needed
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Todos"),
        content: TextField(
          controller: _controller, // Link the controller to the TextField
          decoration: const InputDecoration(
            labelText: 'Add Todos',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                if (_controller.text.isNotEmpty) {
                  arr.add(Todo(text: _controller.text, status: false));
                  _controller.text = "";
                }
              });
            },
            child: const Text('Add'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _controller.text = '';
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
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Chip(
              label: Text(
                  '${arr.where((number) => number.status).toList().length.toString()}/${arr.length.toString()}'),

              backgroundColor: Colors.green, // Background color of the chip
              labelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold), // Label style
              labelPadding: const EdgeInsets.fromLTRB(
                  8, 0, 8, 0), // Padding inside the chip
              shape: const StadiumBorder(
                  side: BorderSide(
                      color: Color.fromARGB(255, 32, 219, 141),
                      width: 1)), // Shape with border
              elevation: 4,
            ),
          ),
          Text(
            widget.username.toUpperCase(),
            style: const TextStyle(
              color:
                  Color.fromARGB(255, 78, 4, 70), // Custom color in ARGB format
              fontSize: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
                child: ClipOval(
              child: Image.network(
                'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                width: 100, // Control the width of the image
                height: 100, // Control the height of the image
                fit: BoxFit.cover, // Resize the image to cover the CircleAvatar
              ),
            )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SingleChildScrollView(
          child: Column(
              children: arr
                  .map((quote) => Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Rounded corners
                              side: BorderSide(
                                  color:
                                      quote.status ? Colors.green : Colors.grey,
                                  width: quote.status
                                      ? 2
                                      : 0), // Border color and width
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(quote.text),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          color: quote.status
                                              ? Colors.green
                                              : Colors.grey,
                                          onPressed: () {
                                            setState(() {
                                              arr[arr.indexOf(quote)].status =
                                                  !quote.status;
                                            });
                                          },
                                          icon: const Icon(Icons.check)),
                                      IconButton(
                                          color: Colors.red,
                                          onPressed: () {
                                            setState(() {
                                              arr.remove(quote);
                                            });
                                          },
                                          icon: const Icon(Icons.delete)),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ))
                  .toList()),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('Todo List'),
            ),
            ListTile(
              title: TextButton.icon(
                icon: const Icon(Icons.logout_outlined), // Icon
                label: const Text('Log out'), // Label text
                onPressed: () {
                  GoRouter.of(context).go('/');
                },
              ),
              onTap: () {
                GoRouter.of(context).go('/');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodos,
        child: const Icon(Icons.add),
        backgroundColor: Colors.white,
      ),
    );
  }
}
