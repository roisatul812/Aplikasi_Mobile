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
                [Color(0xFF56CCF2), Color(0xFF2F80ED)],
                [Color(0xFFFF758C), Color(0xFFFF7EB3)],
                [Color(0xFF36D1DC), Color(0xFF5B86E5)],
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
