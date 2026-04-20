import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/mahasiswa_model.dart';
import '../../data/repositories/mahasiswa_repository.dart';

final mahasiswaProvider =
FutureProvider<List<MahasiswaModel>>((ref) async {

  final repo = MahasiswaRepository();

  return repo.getMahasiswaList();

});