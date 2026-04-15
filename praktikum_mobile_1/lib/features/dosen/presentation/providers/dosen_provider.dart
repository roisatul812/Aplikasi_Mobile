import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/dosen_model.dart';
import '../../data/repositories/dosen_repository.dart';

final dosenProvider = FutureProvider<List<DosenModel>>((ref) async {

  final repo = DosenRepository();

  return repo.getDosenList();

});