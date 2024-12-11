// ignore: file_names
import 'package:flutter/material.dart';

class CadastrarUsuarioPage extends StatefulWidget {
  const CadastrarUsuarioPage({super.key});

  @override
  State<CadastrarUsuarioPage> createState() => _CadastrarUsuarioPageState();
}

class _CadastrarUsuarioPageState extends State<CadastrarUsuarioPage> {
  final TextEditingController _nomeUsuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  String _tipoCargo = 'Administrador';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Cadastrar Usuário'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Image.asset(
                  'lib/assets/animuslogo.jpg', 
                  height: 250, 
                ),
                const SizedBox(height: 16),
                _buildTextField(_nomeUsuarioController, 'Nome de Usuário'),
                const SizedBox(height: 16),
                _buildTextField(_senhaController, 'Senha', isPassword: true),
                const SizedBox(height: 16),
                SizedBox(
                  width: 250, 
                  child: DropdownButtonFormField<String>(
                    value: _tipoCargo,
                    items: ['Administrador', 'Funcionario', 'Médico Veterinario']
                        .map((cargo) => DropdownMenuItem(
                              value: cargo,
                              child: Text(cargo),
                            ))
                        .toList(),
                    onChanged: (valor) {
                      setState(() {
                        _tipoCargo = valor!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Tipo de Cargo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _cadastrarUsuario,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isPassword = false}) {
    return SizedBox(
      width: 250, 
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  void _cadastrarUsuario() {
    final String nomeUsuario = _nomeUsuarioController.text;
    final String senha = _senhaController.text;

    if (nomeUsuario.isNotEmpty && senha.isNotEmpty && senha.length >= 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário cadastrado com sucesso!')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha os campos corretamente.')),
      );
    }
  }
}
