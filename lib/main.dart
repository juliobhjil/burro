import 'package:animus_senai/firebase_options.dart';
import 'package:flutter/material.dart';
import 'tela_inicial.dart'; // Importa o módulo telainicial.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  // Funções CRUD
  await addUser();
  await getUser();
  await updateUser();
  await deleteUser();

  runApp(const MyApp());
}

Future<void> addUser() async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  await users
      .add({'full_name': 'John Doe', 'age': 25})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> getUser() async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DocumentSnapshot snapshot = await users.doc('USER_ID').get();
  if (snapshot.exists) {
    print('User data: ${snapshot.data()}');
  } else {
    print('No such document!');
  }
}

Future<void> updateUser() async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  await users
      .doc('USER_ID')
      .update({'age': 30})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future<void> deleteUser() async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  await users
      .doc('USER_ID')
      .delete()
      .then((value) => print("User Deleted"))
      .catchError((error) => print("Failed to delete user: $error"));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TelaInicial(),
    );
  }
}
