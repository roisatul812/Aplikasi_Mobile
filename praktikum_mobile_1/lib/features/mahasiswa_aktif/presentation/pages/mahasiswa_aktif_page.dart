import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mahasiswa_aktif_provider.dart';

class MahasiswaAktifPage extends ConsumerWidget {

  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final dataAsync = ref.watch(mahasiswaAktifProvider);

    return Scaffold(

      appBar: AppBar(
        title: const Text("Mahasiswa Aktif"),
      ),

      body: dataAsync.when(

        data: (list) {

          return ListView.builder(

            padding: const EdgeInsets.all(16),

            itemCount: list.length,

            itemBuilder: (context, index) {

              final data = list[index];

              return Card(

                margin: const EdgeInsets.only(bottom: 12),

                child: ListTile(

                  leading: CircleAvatar(
                    child: Text(data.id.toString()),
                  ),

                  title: Text(data.title),

                  subtitle: Text(
                    data.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                ),

              );

            },

          );

        },

        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        error: (err, stack) => Center(
          child: Text(err.toString()),
        ),

      ),

    );

  }

}