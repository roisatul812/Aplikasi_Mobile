import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praktikum_mobile_1/core/network/dio_client.dart';
import 'package:praktikum_mobile_1/core/services/local_storage_service.dart';

import '../../data/models/mahasiswa_model.dart';
import '../../data/repositories/mahasiswa_repository.dart';

final localStorageProvider = Provider((ref) => LocalStorageService());

/// Dio
final mahasiswaDioProvider = Provider((ref) => DioClient());

/// Repo
final mahasiswaRepositoryProvider = Provider((ref) {
  final dio = ref.read(mahasiswaDioProvider);
  return MahasiswaRepository(dio);
});

/// API
final mahasiswaProvider = FutureProvider<List<MahasiswaModel>>((ref) async {
  final repo = ref.read(mahasiswaRepositoryProvider);
  return repo.getMahasiswaList();
});

/// LOCAL STORAGE (pakai yang sama)
final mahasiswaSavedProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final storage = ref.read(localStorageProvider);
  return storage.getMahasiswa();
});

/// SAVE
final saveMahasiswaProvider = Provider((ref) {
  return (Map<String, dynamic> user) async {
    final storage = ref.read(localStorageProvider);
    await storage.saveMahasiswa(user);

    ref.invalidate(mahasiswaSavedProvider);
  };
});

/// DELETE
final deleteMahasiswaProvider = Provider((ref) {
  return (int id) async {
    final storage = ref.read(localStorageProvider);
    await storage.removeMahasiswa(id);

    ref.invalidate(mahasiswaSavedProvider);
  };
});