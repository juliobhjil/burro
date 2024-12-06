import 'package:flutter/material.dart';

class CadastrarPetPage extends StatefulWidget {
  const CadastrarPetPage({super.key});

  @override
  State<CadastrarPetPage> createState() => _CadastrarPetPageState();
}

class _CadastrarPetPageState extends State<CadastrarPetPage> {
  final TextEditingController _nomeDonoController = TextEditingController();
  final TextEditingController _cpfDonoController = TextEditingController();
  final TextEditingController _nomePetController = TextEditingController();
  final TextEditingController _especiePetController = TextEditingController();
  final TextEditingController _racaPetController = TextEditingController();
  final TextEditingController _dataNascimentoPetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Pet')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTextField(_nomeDonoController, 'Nome do Tutor'),
                const SizedBox(height: 16),
                _buildTextField(_cpfDonoController, 'CPF do Tutor', isNumber: true),
                const SizedBox(height: 16),
                _buildTextField(_nomePetController, 'Nome do Pet'),
                const SizedBox(height: 16),
                _buildTextField(_especiePetController, 'Espécie do Pet'),
                const SizedBox(height: 16),
                _buildTextField(_racaPetController, 'Raça do Pet'),
                const SizedBox(height: 16),
                _buildTextField(_dataNascimentoPetController, 'Data de Nascimento do Pet'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _cadastrarPet,
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isNumber = false}) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      ),
    );
  }

  void _cadastrarPet() {
    final String nomeDono = _nomeDonoController.text;
    final String cpfDono = _cpfDonoController.text;
    final String nomePet = _nomePetController.text;
    final String especiePet = _especiePetController.text;
    final String racaPet = _racaPetController.text;
    final String dataNascimentoPet = _dataNascimentoPetController.text;

    if (nomeDono.isNotEmpty &&
        cpfDono.isNotEmpty &&
        nomePet.isNotEmpty &&
        especiePet.isNotEmpty &&
        racaPet.isNotEmpty &&
        dataNascimentoPet.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pet cadastrado com sucesso!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
    }
  }
}
