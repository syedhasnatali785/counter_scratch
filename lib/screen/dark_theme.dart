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
          RadioGroup<ThemeMode>(
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,
            child: Column(
              children: [
                RadioListTile(value: ThemeMode.dark, title: Text("D")),
                RadioListTile(value: ThemeMode.light, title: Text("L")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
