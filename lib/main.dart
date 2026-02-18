import 'package:counter_scratch/provider/count_provider.dart';
import 'package:counter_scratch/provider/example_one_provider.dart';
import 'package:counter_scratch/provider/favourite_provider.dart';
import 'package:counter_scratch/screen/count_example.dart';
import 'package:counter_scratch/screen/example_one.dart';
import 'package:counter_scratch/screen/favourite/favourite_screen.dart';
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
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>ExampleOneProvider()),
        ChangeNotifierProvider(create: (_)=>CountProvider()),
      ChangeNotifierProvider(create: (_)=>FavouriteProvider())
    ],
    child: MaterialApp(home: FavouriteScreen(),),);

  }
}
