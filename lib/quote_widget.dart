import 'package:flutter/material.dart';

class QuoteWidget extends StatelessWidget {
  final dynamic quote;
  final Function delete;

  const QuoteWidget({
    super.key,
    required this.quote,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quote.name,
                      style:
                          const TextStyle(fontSize: 18.0, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      quote.text,
                      style:
                          const TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
