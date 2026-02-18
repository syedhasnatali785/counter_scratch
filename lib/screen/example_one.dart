import 'dart:math';

import 'package:counter_scratch/provider/example_one_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  double value = 1.0;
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Slider(
                value: value.value,
                min: 0,
                max: 1,
                onChanged: (valu) {
                  value.setValue(valu);
                },
              );
            },
          ),
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: value.value),
                      ),
                      child: Text("1"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: value.value),
                      ),
                      child: Text("2"),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
