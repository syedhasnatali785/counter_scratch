import 'package:flutter/material.dart';

class ValueNotifyListener extends StatelessWidget {
  ValueNotifyListener({super.key});
  ValueNotifier<int> _count = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _count.value++;
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(valueListenable: toggle, builder: (context, value, child){
            return TextFormField(
              obscureText: toggle.value,
              decoration: InputDecoration(
                suffix: InkWell(onTap: (){
                  toggle.value = !toggle.value;
                },child: Icon(toggle.value ? Icons.visibility_off_outlined : Icons.visibility )),
              ),
            );
          }),

          ValueListenableBuilder(
            valueListenable: _count,
            builder: (context, value, child) {
              return Text(
                _count.value.toString(),
                style: TextStyle(fontSize: 40),
              );
            },
          ),
        ],
      ),
    );
  }
}
