import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dosen_provider.dart';
import '../widgets/dosen_widget.dart';

class DosenPage extends ConsumerWidget {
  const DosenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dosenAsync = ref.watch(dosenProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Dosen"),
      ),
      body: dosenAsync.when(
        data: (dosenList) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: dosenList.length,
            itemBuilder: (context, index) {
              final colors = [
                [Colors.blue, const Color.fromARGB(255, 74, 161, 212)],
                [const Color.fromARGB(255, 244, 80, 135), const Color.fromARGB(255, 251, 146, 197)],
                [const Color.fromARGB(255, 168, 179, 85), const Color.fromARGB(255, 245, 240, 152)],
                [Colors.green, Colors.teal],
                [const Color.fromARGB(255, 117, 134, 228), const Color.fromARGB(255, 132, 196, 228)],
              ];

              return DosenCard(
                dosen: dosenList[index],
                gradientColors: colors[index % colors.length],
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
