import 'package:counter_scratch/provider/count_provider.dart';
import 'package:counter_scratch/screen/count_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main(){
 runApp(counterApp());
}
class counterApp extends StatelessWidget {
  const counterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>CountProvider(), child: MaterialApp(home: CountExample(),),)  ;

  }
}
