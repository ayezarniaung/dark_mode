import 'package:dart_mode/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Switch(
            value: Provider.of<ThemeState>(context, listen: false).theme ==
                ThemeType.DARK,
            onChanged: (value) {
              Provider.of<ThemeState>(context, listen: false).theme =
                  value ? ThemeType.DARK : ThemeType.LIGHT;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
