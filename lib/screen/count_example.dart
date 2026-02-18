import 'dart:async';

import 'package:counter_scratch/main.dart';
import 'package:counter_scratch/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  void initState() {
    super.initState();
 final countProvider = Provider.of<CountProvider>(context, listen: false);
  Timer.periodic(Duration(seconds: 2), (timer){
    context.read<CountProvider>().setCount();

  });
  }

  @override
  Widget build(BuildContext context) {
    print('scaffold Built');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<CountProvider>().setCount();
        },
      ),
      appBar: AppBar(title: Text("CountMe")),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            print('Consumer Built');

            return Text(value.count.toString(), style: TextStyle(fontSize: 40));
          },
        ),
      ),
    );
  }
}
