import 'package:praktikum_mobile_1/core/network/dio_client.dart';
import '../models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  final DioClient _dioClient;

  MahasiswaAktifRepository(this._dioClient);

  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    try {
      final response = await _dioClient.dio.get('/users');

      final data = response.data as List;

      return data
          .map((json) => MahasiswaAktifModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Gagal memuat data mahasiswa aktif: $e");
    }
  }
}