import 'package:flutter/material.dart';
import 'tela_principal.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();
  bool _isSenhaVisivel = false;
  bool _isConfirmarSenhaVisivel = false;

  void _cadastrar() {
    final String email = _emailController.text;
    final String senha = _senhaController.text;
    final String confirmarSenha = _confirmarSenhaController.text;

    if (email.isEmpty || senha.isEmpty || confirmarSenha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, insira um email válido')),
      );
    } else if (senha.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('A senha deve ter pelo menos 6 caracteres')),
      );
    } else if (senha != confirmarSenha) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('As senhas não correspondem')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const TelaPrincipal()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: Colors.orange, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'lib/assets/animuslogo.jpg', 
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Borda preta
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Borda preta ao focar
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _senhaController,
                  obscureText: !_isSenhaVisivel,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Borda preta
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Borda preta ao focar
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isSenhaVisivel ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isSenhaVisivel = !_isSenhaVisivel;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _confirmarSenhaController,
                  obscureText: !_isConfirmarSenhaVisivel,
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Borda preta
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Borda preta ao focar
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmarSenhaVisivel ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmarSenhaVisivel = !_isConfirmarSenhaVisivel;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: _cadastrar,
                  child: const Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
