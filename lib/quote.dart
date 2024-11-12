import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/provider/notifier_provider.dart';
import 'package:my_project/quote_widget.dart';
import 'quotes.dart';

class QuoState extends ConsumerStatefulWidget {
  const QuoState({super.key});

  @override
  ConsumerState<QuoState> createState() => __QuoStateState();
}

class __QuoStateState extends ConsumerState<QuoState> {
  List<Quotes> quotes = [
    Quotes(name: 'Name', text: 'This is text 1'),
    Quotes(name: 'Name', text: 'This is text 2'),
    Quotes(name: 'Name', text: 'This is text 3'),
    Quotes(name: 'Name', text: 'This is text 3'),
    Quotes(name: 'Name', text: 'This is text 3'),
    Quotes(name: 'Name', text: 'This is text 3'),
    Quotes(name: 'Name', text: 'This is text 1'),
    Quotes(name: 'Name', text: 'This is text 2'),
    Quotes(name: 'Name', text: 'This is text 3'),
    Quotes(name: 'Name', text: 'This is text 3'),
    Quotes(name: 'Name', text: 'This is text 3'),
    Quotes(name: 'Name', text: 'This is text 3'),
    Quotes(name: 'Name', text: 'This is text 1'),
    Quotes(name: 'Name', text: 'This is text 2'),
    Quotes(name: 'Name', text: 'This is text 3'),
    Quotes(name: 'Name', text: 'This is text 3'),
    Quotes(name: 'Name', text: 'This is text 3'),
    Quotes(name: 'Name', text: 'This is text 3'),
  ];

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(product.length.toString()),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        // Wrapping the column in SingleChildScrollView
        child: Column(
            children: quotes
                .map((quote) => QuoteWidget(
                      quote: quote,
                      delete: () {
                        setState(() {
                          quotes.remove(quote);
                        });
                      },
                    ))
                .toList()), // body is accessible here
      ),
    );
  }
}
