import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/provider/dio_provider.dart';

class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  void _onButtonPressed(int c) {
    print(c + c);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        backgroundColor: Colors.amber,
      ),
      body: postsAsyncValue.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              if (index < 20) {
                final post = data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(post.title),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(post.body),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {
                            print('Trailing icon pressed');
                          },
                        ),
                        onTap: () {
                          print('Tapped on Alice');
                        },
                      )),
                );
              }
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Call the function with parameters inside the closure
      //     _onButtonPressed(42);
      //   },
      //   backgroundColor: Colors.amber,
      //   child: const Text("Click"),
      // ),
    );
  }
}
