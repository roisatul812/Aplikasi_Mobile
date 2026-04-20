import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mahasiswa_aktif_provider.dart';

class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(mahasiswaAktifProvider);
    final savedAsync = ref.watch(mahasiswaAktifSavedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahasiswa Aktif"),
      ),
      body: Column(
        children: [
          /// LOCAL STORAGE
          savedAsync.when(
            data: (users) {
              if (users.isEmpty) return const SizedBox();

              return Container(
                padding: const EdgeInsets.all(12),
                color: Colors.green.shade50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Data Tersimpan"),
                    ...users.map((u) => ListTile(
                          title: Text(u['name']),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              ref
                                  .read(deleteMahasiswaAktifProvider)(u['id']);
                            },
                          ),
                        ))
                  ],
                ),
              );
            },
            loading: () => const SizedBox(),
            error: (e, _) => Text(e.toString()),
          ),

          /// API DATA
          Expanded(
            child: dataAsync.when(
              data: (list) {
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final mhs = list[index];

                    return Stack(
                      children: [
                        ListTile(
                          title: Text(mhs.name),
                          subtitle: Text(mhs.email),
                        ),

                        Positioned(
                          right: 10,
                          child: IconButton(
                            icon: const Icon(Icons.save),
                            onPressed: () {
                              ref.read(saveMahasiswaAktifProvider)({
                                "id": mhs.id,
                                "name": mhs.name,
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (e, _) => Center(child: Text(e.toString())),
            ),
          ),
        ],
      ),
    );
  }
}