import 'package:flutter/material.dart';

class MatkulPage extends StatelessWidget {
  const MatkulPage({super.key});

  @override
  Widget build(BuildContext context) {
    final matkulList = [
      "Mobile Programming",
      "Web Development",
      "Artificial Intelligence",
      "Basis Data",
      "Jaringan Komputer"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mata Kuliah"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: matkulList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.menu_book),
              title: Text(matkulList[index]),
            ),
          );
        },
      ),
    );
  }
}