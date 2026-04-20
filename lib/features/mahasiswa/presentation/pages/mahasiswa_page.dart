import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mahasiswa_provider.dart';

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaAsync = ref.watch(mahasiswaProvider);
    final savedAsync = ref.watch(mahasiswaSavedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Mahasiswa"),
      ),
      body: Column(
        children: [
          /// ===============================
          /// 🔥 LOCAL STORAGE SECTION
          /// ===============================
          savedAsync.when(
            data: (users) {
              if (users.isEmpty) return const SizedBox();

              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.green.shade50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Data Tersimpan (Local)",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    ...users.map((user) => ListTile(
                          title: Text(user['name']),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              ref
                                  .read(deleteMahasiswaProvider)(user['id']);
                            },
                          ),
                        )),
                  ],
                ),
              );
            },
            loading: () => const SizedBox(),
            error: (e, _) => Text(e.toString()),
          ),

          /// ===============================
          /// 📡 DATA API
          /// ===============================
          Expanded(
            child: mahasiswaAsync.when(
              data: (list) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final mhs = list[index];

                    return Stack(
                      children: [
                        Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(mhs.name.substring(0, 1)),
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
                        ),

                        /// 💾 BUTTON SAVE
                        Positioned(
                          right: 10,
                          top: 10,
                          child: IconButton(
                            icon:
                                const Icon(Icons.save, color: Colors.blue),
                            onPressed: () {
                              ref.read(saveMahasiswaProvider)({
                                "id": mhs.id,
                                "name": mhs.name,
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("${mhs.name} disimpan"),
                                ),
                              );
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
              error: (err, stack) => Center(
                child: Text(err.toString()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}