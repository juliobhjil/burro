import 'package:flutter/material.dart';
import 'tela_inicial.dart'; // Importa a tela de login/cadastro

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Principal'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
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

// As classes das páginas de cadastro e histórico médico

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Campo de nome do dono
              Container(
                width: 300, // Largura do campo de digitação
                child: TextField(
                  controller: _nomeDonoController,
                  decoration: const InputDecoration(
                    labelText: 'Nome do Dono',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Campo de CPF do dono
              Container(
                width: 300,
                child: TextField(
                  controller: _cpfDonoController,
                  decoration: const InputDecoration(
                    labelText: 'CPF do Dono',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 16),

              // Campo de nome do pet
              Container(
                width: 300,
                child: TextField(
                  controller: _nomePetController,
                  decoration: const InputDecoration(
                    labelText: 'Nome do Pet',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Campo de espécie do pet
              Container(
                width: 300,
                child: TextField(
                  controller: _especiePetController,
                  decoration: const InputDecoration(
                    labelText: 'Espécie do Pet',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Campo de raça do pet
              Container(
                width: 300,
                child: TextField(
                  controller: _racaPetController,
                  decoration: const InputDecoration(
                    labelText: 'Raça do Pet',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Campo de data de nascimento do pet
              Container(
                width: 300,
                child: TextField(
                  controller: _dataNascimentoPetController,
                  decoration: const InputDecoration(
                    labelText: 'Data de Nascimento do Pet',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              const SizedBox(height: 24),

              // Botão de envio
              ElevatedButton(
                onPressed: _cadastrarPet,
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
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
      // Adicione a lógica para salvar os dados do pet aqui

      // Exibe uma mensagem de sucesso ou navega para outra tela, se necessário
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pet cadastrado com sucesso!')),
      );
    } else {
      // Adiciona mensagem de erro se algum campo estiver vazio
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

class CadastrarDonoPage extends StatefulWidget {
  const CadastrarDonoPage({super.key});

  @override
  State<CadastrarDonoPage> createState() => _CadastrarDonoPageState();
}

class _CadastrarDonoPageState extends State<CadastrarDonoPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _localizacaoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _nomePetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Dono')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 16),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome do Dono',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _localizacaoController,
                    decoration: const InputDecoration(
                      labelText: 'Localização',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _telefoneController,
                    decoration: const InputDecoration(
                      labelText: 'Telefone',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _nomePetController,
                    decoration: const InputDecoration(
                      labelText: 'Nome do Pet',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para cadastrar dono.
                      // Pode incluir validações e armazenamento em banco de dados.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Dono cadastrado com sucesso!')),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('Cadastrar Dono'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
