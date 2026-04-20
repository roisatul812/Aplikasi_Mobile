import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/dosen_provider.dart';
import '../widgets/dosen_widget.dart';

class DosenPage extends ConsumerWidget {
  const DosenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dosenAsync = ref.watch(dosenProvider);
    final savedUsersAsync = ref.watch(savedUsersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Dosen"),
      ),
      body: Column(
        children: [
          /// 🔥 SECTION LOCAL STORAGE
          savedUsersAsync.when(
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),

                    /// LIST DATA LOCAL
                    ...users.map(
                      (user) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(user['name']),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            ref.read(deleteUserProvider)(user['id']);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            loading: () => const SizedBox(),
            error: (e, _) => Text(e.toString()),
          ),

          /// 📡 DATA API DOSEN
          Expanded(
            child: dosenAsync.when(
              data: (dosenList) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: dosenList.length,
                  itemBuilder: (context, index) {
                    final dosen = dosenList[index];

                    final colors = [
                      [Colors.blue, const Color.fromARGB(255, 74, 161, 212)],
                      [const Color.fromARGB(255, 244, 80, 135), const Color.fromARGB(255, 251, 146, 197)],
                      [const Color.fromARGB(255, 168, 179, 85), const Color.fromARGB(255, 245, 240, 152)],
                      [Colors.green, Colors.teal],
                      [const Color.fromARGB(255, 117, 134, 228), const Color.fromARGB(255, 132, 196, 228)],
                    ];

                    return Stack(
                      children: [
                        DosenCard(
                          dosen: dosen,
                          gradientColors: colors[index % colors.length],
                        ),

                        /// 💾 BUTTON SAVE
                        Positioned(
                          right: 10,
                          top: 10,
                          child: IconButton(
                            icon: const Icon(Icons.save, color: Colors.white),
                            onPressed: () {
                              ref.read(saveUserProvider)({
                                "id": dosen.id,
                                "name": dosen.name,
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${dosen.name} disimpan"),
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