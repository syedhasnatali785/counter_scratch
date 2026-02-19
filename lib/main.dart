import 'package:counter_scratch/provider/auth_provider.dart';
import 'package:counter_scratch/provider/count_provider.dart';
import 'package:counter_scratch/provider/example_one_provider.dart';
import 'package:counter_scratch/provider/favourite_provider.dart';
import 'package:counter_scratch/provider/theme_changer_provider.dart';
import 'package:counter_scratch/screen/count_example.dart';
import 'package:counter_scratch/screen/dark_theme.dart';
import 'package:counter_scratch/screen/example_one.dart';
import 'package:counter_scratch/screen/favourite/favourite_screen.dart';
import 'package:counter_scratch/screen/login.dart';
import 'package:counter_scratch/screen/value_notify_listener.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(counterApp());
}

class counterApp extends StatelessWidget {
  const counterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            themeMode: themeChanger.themeMode,
            home: Login(),
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.red,
                brightness: Brightness.light,
              ),
              iconTheme: IconThemeData(color: Colors.orange),
              appBarTheme: AppBarTheme(backgroundColor: Colors.teal),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green,
                brightness: Brightness.dark,
              ),
              iconTheme: IconThemeData(color: Colors.indigoAccent),
              appBarTheme: AppBarTheme(backgroundColor: Colors.green),
            ),
          );
        },
      ),
    );
  }
}
