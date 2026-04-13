import '../models/dosen_model.dart';

class DosenRepository {

  Future<List<Dosen>> getDosen() async {

    await Future.delayed(const Duration(seconds: 1));

    return [
      Dosen(
        nama: "Anank Prasetyo",
        nidn: "001",
        bidang: "Mobile Programming",
      ),
      Dosen(
        nama: "Rachman Sinatriya",
        nidn: "002",
        bidang: "Web Development",
      ),
      Dosen(
        nama: "Aifan Sukma",
        nidn: "003",
        bidang: "Artificial Intelligence",
      ),
    ];
  }

}