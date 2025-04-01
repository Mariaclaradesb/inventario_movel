import 'package:flutter/material.dart';
import 'package:inventarioapp/initial_screen.dart';
import 'package:inventarioapp/task.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: InitialScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}







