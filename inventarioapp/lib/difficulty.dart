import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {

  final int dificulty_level;

  const Difficulty({
    required this.dificulty_level,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(child: Icon(Icons.star, color: dificulty_level >= 1 ? Colors.blue : Colors.grey,size: 20,),),
        Container(child: Icon(Icons.star, color: dificulty_level >= 2 ? Colors.blue : Colors.grey,size: 20),),
        Container(child: Icon(Icons.star, color: dificulty_level >= 3 ? Colors.blue : Colors.grey,size: 20),),
        Container(child: Icon(Icons.star, color: dificulty_level >= 4 ? Colors.blue : Colors.grey,size: 20),),
        Container(child: Icon(Icons.star, color: dificulty_level >= 5 ? Colors.blue : Colors.grey,size: 20),)
      ],
    );
  }
}