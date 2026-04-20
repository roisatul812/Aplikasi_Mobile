import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praktikum_mobile_1/core/network/dio_client.dart';
import 'package:praktikum_mobile_1/core/services/local_storage_service.dart';

import '../../data/models/dosen_model.dart';
import '../../data/repositories/dosen_repository.dart';

/// 🔌 DIO PROVIDER
final dioProvider = Provider((ref) => DioClient());

/// 📦 REPOSITORY PROVIDER
final dosenRepositoryProvider = Provider((ref) {
  final dio = ref.read(dioProvider);
  return DosenRepository(dio);
});

/// 💾 LOCAL STORAGE PROVIDER
final localStorageProvider = Provider((ref) => LocalStorageService());

/// 📡 API DOSEN PROVIDER
final dosenProvider = FutureProvider<List<DosenModel>>((ref) async {
  final repo = ref.read(dosenRepositoryProvider);
  return repo.getDosenList();
});

/// 💾 GET DATA LOCAL STORAGE
final savedUsersProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final storage = ref.read(localStorageProvider);
  return storage.getDosen();
});

/// 💾 SAVE USER KE LOCAL STORAGE
final saveUserProvider = Provider((ref) {
  return (Map<String, dynamic> user) async {
    final storage = ref.read(localStorageProvider);
    await storage.saveDosen(user);

    // refresh otomatis
    ref.invalidate(savedUsersProvider);
  };
});

/// ❌ DELETE USER DARI LOCAL STORAGE
final deleteUserProvider = Provider((ref) {
  return (int id) async {
    final storage = ref.read(localStorageProvider);
    await storage.removeDosen(id);

    // refresh otomatis
    ref.invalidate(savedUsersProvider);
  };
});