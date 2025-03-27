import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter & Spring Boot'),
        ),
        body: Center(
          child: FutureBuilder<Object>(
            future: fetchGreeting(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) { 
                return Text('Error: ${snapshot.error}'); //Está aparecendo a mensagem de erro
              } else { 
                return Text('Response: ${snapshot.data}');
              }
            },
          ),
        ),
      ),
    );
  }

  Future<Object> fetchGreeting() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/produtos')); //TESTAR DEPOIS
    if (response.statusCode == 200) {
      return json.decode(response.body)['message']; 
    } else {
      throw Exception('Failed to load greeting');
    }
  }
}