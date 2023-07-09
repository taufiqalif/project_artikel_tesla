import 'package:flutter/material.dart';
import 'package:berita/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Http',
      theme: ThemeData(appBarTheme: const AppBarTheme(elevation: 0)),
      home: Home(),
    );
  }
}
