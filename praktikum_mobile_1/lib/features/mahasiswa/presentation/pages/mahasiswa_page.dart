import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mahasiswa_provider.dart';

class MahasiswaPage extends ConsumerWidget {

  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final mahasiswaAsync = ref.watch(mahasiswaProvider);

    return Scaffold(

      appBar: AppBar(
        title: const Text("Data Mahasiswa"),
      ),

      body: mahasiswaAsync.when(

        data: (list) {

          return ListView.builder(

            padding: const EdgeInsets.all(16),

            itemCount: list.length,

            itemBuilder: (context, index) {

              final mhs = list[index];

              return Card(

                margin: const EdgeInsets.only(bottom: 12),

                child: ListTile(

                  leading: CircleAvatar(
                    child: Text(mhs.name.substring(0,1)),
                  ),

                  title: Text(mhs.name),

                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(mhs.email),

                      Text(
                        mhs.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                    ],
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