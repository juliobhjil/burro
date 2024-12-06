import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class CadastrarTutorPage extends StatefulWidget {
  const CadastrarTutorPage({super.key});

  @override
  State<CadastrarTutorPage> createState() => _CadastrarTutorPageState();
}


class _CadastrarTutorPageState extends State<CadastrarTutorPage> {
  final TextEditingController _nomeTutorController = TextEditingController();
  final TextEditingController _cpfTutorController = TextEditingController();
  final TextEditingController _emailTutorController = TextEditingController();
  final TextEditingController _telefoneTutorController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _numeroCasaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Tutor')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTextField(_nomeTutorController, 'Nome do Tutor'),
                const SizedBox(height: 16),
                _buildTextField(_cpfTutorController, 'CPF do Tutor', isNumber: true),
                const SizedBox(height: 16),
                _buildTextField(_emailTutorController, 'Email', isNumber: false),
                const SizedBox(height: 16),
                _buildTextField(_telefoneTutorController, 'Número de Telefone', isNumber: true),
                const SizedBox(height: 16),
                _buildTextField(_cidadeController, 'Cidade'),
                const SizedBox(height: 16),
                _buildTextField(_bairroController, 'Bairro'),
                const SizedBox(height: 16),
                _buildTextField(_ruaController, 'Rua'),
                const SizedBox(height: 16),
                _buildTextField(_numeroCasaController, 'Número da Casa', isNumber: true),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _cadastrarTutor,
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

  void _cadastrarTutor() {
    final String nomeTutor = _nomeTutorController.text;
    final String cpfTutor = _cpfTutorController.text;
    final String emailTutor = _emailTutorController.text;
    final String telefoneTutor = _telefoneTutorController.text;
    final String cidade = _cidadeController.text;
    final String bairro = _bairroController.text;
    final String rua = _ruaController.text;
    final String numeroCasa = _numeroCasaController.text;

    if (nomeTutor.isNotEmpty &&
        cpfTutor.isNotEmpty &&
        emailTutor.isNotEmpty &&
        telefoneTutor.isNotEmpty &&
        cidade.isNotEmpty &&
        bairro.isNotEmpty &&
        rua.isNotEmpty &&
        numeroCasa.isNotEmpty) {
      if (CPFValidator.isValid(cpfTutor)) {
        if (EmailValidator.validate(emailTutor)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tutor cadastrado com sucesso!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email inválido.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('CPF inválido.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
    }
  }
}