import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/init_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouApp',
      debugShowCheckedModeBanner: false,
      home: InitPage(),
    );
  }
}
