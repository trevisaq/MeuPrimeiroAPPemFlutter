import 'package:flutter/material.dart';
import 'package:trevisan_streaming/pages/cadastro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 178, 184),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 178, 184),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  icon: Icon(Icons.mail),
                  hintText: "Informe seu E-mail",
                  iconColor: Color.fromARGB(255, 10, 178, 184),
                ),
                validator: (String? email) {
                  if (email == null || email.isEmpty) {
                    return "O e-mail não pode ser vazio";
                  }
                  if (email.length < 6) {
                    return "O e-mail é muito curto";
                  }
                  if (!email.contains("@")) {
                    return "E-mail inválido";
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: _showPassword == false ? true : false,
                decoration: InputDecoration(
                  icon: const Icon(Icons.lock),
                  iconColor: const Color.fromARGB(255, 10, 178, 184),
                  suffixIcon: GestureDetector(
                    child: Icon(_showPassword == false
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                  hintText: "Informe sua senha",
                ),
                validator: (String? senha) {
                  if (senha == null || senha.isEmpty) {
                    return "O campo senha não pode ser vazio";
                  }
                  if (senha.length < 4) {
                    return "A sua senha é muito curta";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  buttonEnterClick();
                },
                child: const Text("Entrar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 10, 178, 184),
                  foregroundColor: Colors.white,
                  fixedSize: const Size(350, 30),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Se não tiver um cadastro, clique no link abaixo",
                style: TextStyle(color: Color.fromARGB(199, 131, 131, 131)),
              ),
              const SizedBox(height: 40),
              GestureDetector(child: const Text("Me cadastrar",
              style: TextStyle(
                color: Color.fromARGB(255, 10, 178, 184),
                fontSize: 18,
              ),),
              onTap:() => {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const Cadastro() )),
              }),
            ],
          ),
        ),
      ),
    );
  }
  buttonEnterClick() {
    if (_formKey.currentState!.validate()) {
      print("Form ok");
    } else {
      print("Form erro");
    }
  }
}
