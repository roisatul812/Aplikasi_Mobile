import '../models/dosen_model.dart';

class DosenRepository {

  Future<List<Dosen>> getDosenList() async {

    await Future.delayed(const Duration(seconds: 1));

    return [

      Dosen(
        nama: "Anank Prasetyo",
        nip: "123456789",
        email: "anank.prasetyo@example.com",
        jurusan: "Teknik Informatika",
      ),

      Dosen(
        nama: "Rachman Sinatriya",
        nip: "987654321",
        email: "rachman.sinatriya@example.com",
        jurusan: "Teknik Informatika",
      ),

      Dosen(
        nama: "Aifan Sukma",
        nip: "456789123",
        email: "aifan.sukma@example.com",
        jurusan: "Teknik Informatika",
      ),
    ];
  }
}