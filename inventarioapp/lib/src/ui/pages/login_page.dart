import 'package:flutter/material.dart';
import 'package:inventarioapp/components/textfield.dart';
import 'package:inventarioapp/components/mybutton.dart';

class LoginPage extends StatelessWidget {
    LoginPage({super.key});

    //Edição do texto controllers
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    //função signuserin
    void signUser() {
      print('Usuario clico tlgd dps vemos a função não tem pra que agr');
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
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

                const SizedBox(height: 25),

                //Username campo
                MyTextField(
                  controller: usernameController,
                  hintText: 'Usuario',
                  obscureText: false
                ), //Campo usuario
                
                const SizedBox(height: 10),

                //Password campo
                MyTextField(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: true
                ), // Campo senha

                //sign buttom
                const SizedBox(height:30),
                MyButton(
                  onTap: signUser
                ),
              ],
            )

          )
        )
            
          

      );
    }
}

