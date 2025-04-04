import 'package:flutter/material.dart';
import 'package:inventarioapp/data/task_inherited.dart';
import 'package:inventarioapp/screens/form_screen.dart';
import 'package:inventarioapp/screens/initial_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskInherited(child: const InitialScreen()),
      debugShowCheckedModeBanner: false,
    );
  }
}







