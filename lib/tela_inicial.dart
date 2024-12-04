import 'package:flutter/material.dart';
import 'tela_principal.dart'; // Alterado para tela_principal.dart

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _login() {
    final String email = _emailController.text;
    final String senha = _senhaController.text;

    // Aqui você pode adicionar lógica de autenticação com Firebase ou outra lógica
    if (email.isNotEmpty && senha.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TelaPrincipal()), // Alterado para TelaPrincipal
      );
    } else {
      // Adicionar mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
    }
  }

  void _cadastro() {
    final String email = _emailController.text;
    final String senha = _senhaController.text;

    // Lógica de cadastro (exemplo, poderia ser com Firebase)
    if (email.isNotEmpty && senha.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TelaPrincipal()), // Alterado para TelaPrincipal
      );
    } else {
      // Adicionar mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Inicial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 24),
              Container(
                width: 300,
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 300,
                child: TextField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: 300,
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text('Logar'),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 300,
                child: ElevatedButton(
                  onPressed: _cadastro,
                  child: const Text('Cadastrar-se'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
