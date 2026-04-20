import 'package:praktikum_mobile_1/core/network/dio_client.dart';
import '../models/mahasiswa_model.dart';

class MahasiswaRepository {
  final DioClient _dioClient;

  MahasiswaRepository(this._dioClient);

  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final response = await _dioClient.dio.get('/users');

      final data = response.data as List;

      return data
          .map((json) => MahasiswaModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Gagal memuat data mahasiswa: $e");
    }
  }
}