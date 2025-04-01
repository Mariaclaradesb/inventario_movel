import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
    const LoginPage({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Column(
              children: const [
                SizedBox(height: 50),
                //Logo
                 Icon(
                  Icons.lock,
                  size: 136,
                ), //Icon provisorio pra ver posição

                SizedBox(height: 50),

                //Area de titulo de Login
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 36,
                  ), //Estilo do texto
                ), //Texto

                //Username campo

                //Password campo

                //sign buttomd
              ],
            )

          )
        )
            
          

      );
    }
}

