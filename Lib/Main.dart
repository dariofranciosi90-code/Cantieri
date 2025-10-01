import 'package:flutter/material.dart';

void main() {
  runApp(const CantieriApp());
}

class CantieriApp extends StatelessWidget {
  const CantieriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cantieri App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> cantieri = [];

  void _addCantiere() {
    showDialog(
      context: context,
      builder: (ctx) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text("Nuovo Cantiere"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: "Nome cantiere"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  cantieri.add(controller.text);
                });
                Navigator.pop(ctx);
              },
              child: const Text("Aggiungi"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cantieri"),
      ),
      body: ListView.builder(
        itemCount: cantieri.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(cantieri[i]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CantierePage(nome: cantieri[i]),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCantiere,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CantierePage extends StatelessWidget {
  final String nome;
  const CantierePage({super.key, required this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nome)),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Ore di lavoro"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Materiali"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Rapporto manutenzione/intervento"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
