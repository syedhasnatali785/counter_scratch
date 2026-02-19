import 'package:flutter/material.dart';

class ValueNotifyListener extends StatelessWidget {
   ValueNotifyListener({super.key});
ValueNotifier<int> _count = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: (){
      _count.value++;
    }),body: Column(children: [
      ValueListenableBuilder(valueListenable: _count, builder: (context, value, child){
        return Text(_count.value.toString());
      })
    ],),);
  }
}
