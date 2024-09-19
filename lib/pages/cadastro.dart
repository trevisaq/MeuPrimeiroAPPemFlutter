import 'package:flutter/material.dart';

class Cadastro2 extends StatefulWidget {
  const Cadastro2({super.key});

  @override
  State<Cadastro2> createState() => _Cadastro2State();
}

class _Cadastro2State extends State<Cadastro2> {
  final _formKey = GlobalKey<FormState>();
  String? _senha; // Variável para armazenar a senha

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 10, 178, 184),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 10, 178, 184),
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
                  "Cadastre-se já!",
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
                  icon: Icon(Icons.person),
                  hintText: "Nome completo",
                  iconColor: Color.fromARGB(255, 10, 178, 184),
                ),
                validator: (String? nome) {
                  if (nome == null || nome.isEmpty) {
                    return "O campo nome não pode ser vazio";
                  }
                }
              ), // Campo de entrada
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.numbers),
                  hintText: "CPF",
                  iconColor: Color.fromARGB(255, 10, 178, 184),
                ),
                validator: (String? cpf) {
                  if (cpf == null || cpf.isEmpty) {
                    return "O campo cpf não pode ser vazio";
                  }
                   if (cpf.contains(RegExp(r'[A-Z]')) || cpf.contains(RegExp(r'[a-z]'))) {
                    return "O CPF não pode conter letras";
                  }
                  if (cpf.length < 11) {
                    return "CPF inválido ou mal digitado";
                  }
                  return null;
                },
              ),
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
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Informe sua senha",
                  iconColor: Color.fromARGB(255, 10, 178, 184),
                ),
                validator: (String? senha) {
                  if (senha == null || senha.isEmpty) {
                    return "O campo senha não pode ser vazio";
                  }
                  if (senha.length < 4) {
                    return "A sua senha é muito curta";
                  }
                  if (!senha.contains(RegExp(r'[A-Z]'))) {
                    return "A senha deve conter um caractere maiúsculo";
                  }
                  if (!senha.contains(RegExp(r'[0-9]'))) {
                    return "A senha deve conter pelo menos um numero";
                  }
                  _senha = senha;
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.content_paste),
                  hintText: "Confirme sua senha",
                  iconColor: Color.fromARGB(255, 10, 178, 184),
                ),
                validator: (String? Csenha) {
                  if (Csenha == null || Csenha.isEmpty) {
                    return "O campo senha não pode ser vazio";
                  }
                    if (Csenha != _senha) {
                    return "As senhas não coincidem";
                  }
                }
              ), // Campo de entrada
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: "Telefone",
                  iconColor: Color.fromARGB(255, 10, 178, 184),
                ),
                validator: (String? fone) {
                  if (fone == null || fone.isEmpty) {
                    return "O campo telefone não pode ser vazio";
                  }
                  if (fone.length < 14) {
                    return "Telefone inválido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  buttonEnterClick();
                },
                child: const Text("Me cadastrar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 10, 178, 184),
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
              const SizedBox(height: 40)
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
