import 'package:flutter/material.dart';
import 'package:inventarioapp/src/config/injection_container.dart';
import 'package:inventarioapp/src/ui/pages/consultap_page.dart';


void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConsultapPage(),
    );
  }
}
