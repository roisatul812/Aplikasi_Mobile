import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {

  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {

    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );

    if (response.statusCode == 200) {

      final List data = jsonDecode(response.body);

      return data
          .map((json) => MahasiswaAktifModel.fromJson(json))
          .toList();

    } else {

      throw Exception("Gagal memuat data");

    }

  }

}