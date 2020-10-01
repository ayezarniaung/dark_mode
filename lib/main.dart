import 'package:dart_mode/ui/home.dart';
import 'package:dart_mode/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeState(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeState>(context).theme == ThemeType.DARK
          ? ThemeData.dark()
          : ThemeData.light(),
      home: HomePage(),
    );
  }
}
