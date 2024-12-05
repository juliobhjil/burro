import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'tela_inicial.dart'; // Importa a tela de login/cadastro

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo ao Animus'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 150, 64, 7),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Cadastrar Pet'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CadastrarPetPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Cadastrar Tutor'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CadastrarTutorPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Pets Cadastrados'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PetsCadastradosPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Histórico Médico'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoricoMedicoPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                _sair(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: const Text(
          'Bem-vindo à tela principal!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  void _sair(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar saída'),
          content: const Text('Você tem certeza que deseja sair?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaInicial()), // Volta para a tela de login/cadastro
                );
              },
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o dialog
              },
              child: const Text('Não'),
            ),
          ],
        );
      },
    );
  }
}

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
    return Container(
      width: 300,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
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
    return Container(
      width: 300,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
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

class PetsCadastradosPage extends StatelessWidget {
  const PetsCadastradosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pets Cadastrados')),
      body: const Center(child: Text('Tela com lista de pets cadastrados')),
    );
  }
}

class HistoricoMedicoPage extends StatelessWidget {
  const HistoricoMedicoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico Médico')),
      body: const Center(child: Text('Tela com histórico médico do pet')),
    );
  }
}
