import 'package:praktikum_mobile_1/core/network/dio_client.dart';
import '../models/dosen_model.dart';

class DosenRepository {
  final DioClient _dioClient;

  DosenRepository(this._dioClient);

  Future<List<DosenModel>> getDosenList() async {
    try {
      final response = await _dioClient.dio.get('/users');

      final data = response.data as List;

      return data
          .map((json) => DosenModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Gagal memuat data dosen: $e");
    }
  }
}