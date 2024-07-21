import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProviderClass extends StatelessWidget {
  StreamProviderClass({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Stream<int> numberStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Stream Provider'),
      ),
      body: StreamProvider<int>(
        create: (context) => numberStream(),
        initialData: 0,
        child: Center(
          child: Consumer<int>(
            builder: (context, number, child) {
              return Text('Number :- $number');
            },
          ),
        ),
      ),
    );
  }
}
