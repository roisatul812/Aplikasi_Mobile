import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praktikum_mobile_1/core/network/dio_client.dart';
import 'package:praktikum_mobile_1/core/services/local_storage_service.dart';

import '../../data/models/mahasiswa_aktif_model.dart';
import '../../data/repositories/mahasiswa_aktif_repository.dart';

/// LOCAL STORAGE
final localStorageProvider = Provider((ref) => LocalStorageService());

/// DIO
final mahasiswaAktifDioProvider = Provider((ref) => DioClient());

/// REPOSITORY
final mahasiswaAktifRepositoryProvider = Provider((ref) {
  final dio = ref.read(mahasiswaAktifDioProvider);
  return MahasiswaAktifRepository(dio);
});

/// API
final mahasiswaAktifProvider =
    FutureProvider<List<MahasiswaAktifModel>>((ref) async {
  final repo = ref.read(mahasiswaAktifRepositoryProvider);
  return repo.getMahasiswaAktifList();
});

/// LOCAL DATA
final mahasiswaAktifSavedProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final storage = ref.read(localStorageProvider);
  return storage.getMahasiswaAktif();
});

/// SAVE
final saveMahasiswaAktifProvider = Provider((ref) {
  return (Map<String, dynamic> user) async {
    final storage = ref.read(localStorageProvider);
    await storage.saveMahasiswaAktif(user);

    ref.invalidate(mahasiswaAktifSavedProvider);
  };
});

/// DELETE
final deleteMahasiswaAktifProvider = Provider((ref) {
  return (int id) async {
    final storage = ref.read(localStorageProvider);
    await storage.removeMahasiswaAktif(id);

    ref.invalidate(mahasiswaAktifSavedProvider);
  };
});