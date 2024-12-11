import 'package:animus_senai/cadastrarTutor.dart';
import 'package:animus_senai/cadastrarUsu.dart';
import 'package:animus_senai/cadastropets.dart';
import 'package:flutter/material.dart';
import 'tela_inicial.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo ao Animus'),
        backgroundColor: Colors.orangeAccent[200], // Cor suave e vibrante para o AppBar
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFB2FF59),  // Verde suave
                Color(0xFF81C784),  // Verde mais claro
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
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
                title: const Text('Pets'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CadastrarPetPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Donos'),
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
                title: const Text('Donos Cadastrados'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DonosCadastradosPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Admin'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CadastrarUsuarioPage()),
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
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB2FF59),  // Verde suave
              Color(0xFF81C784),  // Verde mais claro
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text(
            'Bem-vindo ao app Animus!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
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
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaInicial()),
                );
              },
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Não'),
            ),
          ],
        );
      },
    );
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

class DonosCadastradosPage extends StatelessWidget {
  const DonosCadastradosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Donos Cadastrados')),
      body: const Center(child: Text('Tela com lista de donos cadastrados')),
    );
  }
}
