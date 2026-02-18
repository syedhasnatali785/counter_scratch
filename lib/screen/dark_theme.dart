import 'package:counter_scratch/provider/theme_changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            value: ThemeMode.light,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile(
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,
          ),
        ],
      ),
    );
  }
}
