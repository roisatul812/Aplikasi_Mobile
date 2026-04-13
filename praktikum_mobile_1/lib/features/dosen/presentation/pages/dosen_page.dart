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
              return DosenCard(dosen: dosenList[index]);
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