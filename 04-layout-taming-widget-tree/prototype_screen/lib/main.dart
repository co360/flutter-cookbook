import 'package:flutter/material.dart';
import 'package:prototype_screen/deep_tree.dart';
import 'package:prototype_screen/e_commerce_screen_before.dart';
import 'package:prototype_screen/flex_screen.dart';
import 'package:prototype_screen/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green,
        appBarTheme: AppBarTheme(
            elevation: 10,
            textTheme: TextTheme(
                headline6: TextStyle(fontFamily: 'Mukta', fontSize: 18))),
      ),
      home: ECommerceScreen(),
    );
  }
}
