import 'package:flutter/material.dart';
import 'package:inventarioapp/components/textfield.dart';
import 'package:inventarioapp/components/mybutton.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Edição do texto controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  //função signuserin
  void signUser() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, "/pathScreen");
    }
  }

  bool fieldValidation(value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  //Logo
                  Icon(Icons.lock, size: 136), //Icon provisorio pra ver posição

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
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Digite o usuário';
                      if (value != 'ADMIN') return 'Usuário incorreto';
                      return null;
                    },
                  ), //Campo usuario

                  const SizedBox(height: 10),

                  //Password campo
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Senha',
                    obscureText: true,
                    validator: (value)  {
                      if (value == null || value.isEmpty) return 'Digite a senha';
                      if (value != 'ADMIN') return 'Senha incorreta';
                      return null;
                    },
                  ), // Campo senha
                  //sign buttom
                  const SizedBox(height: 30),
                  MyButton(onTap: signUser),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
