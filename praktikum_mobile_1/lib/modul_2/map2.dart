import 'dart:io';

void main() {

  // INPUT DATA MAHASISWA (SINGLE)
  print("=== INPUT DATA MAHASISWA ===");

  stdout.write("Masukkan NIM: ");
  String nim = stdin.readLineSync()!;

  stdout.write("Masukkan Nama: ");
  String nama = stdin.readLineSync()!;

  stdout.write("Masukkan Jurusan: ");
  String jurusan = stdin.readLineSync()!;

  stdout.write("Masukkan IPK: ");
  String ipk = stdin.readLineSync()!;

  Map<String, dynamic> mahasiswa = {
    'nim': nim,
    'nama': nama,
    'jurusan': jurusan,
    'ipk': double.parse(ipk),
  };

  print("\nData Mahasiswa: $mahasiswa");

  // INPUT MULTIPLE MAHASISWA
  print("\n=== INPUT MULTIPLE MAHASISWA ===");

  stdout.write("Masukkan jumlah mahasiswa: ");
  int jumlah = int.parse(stdin.readLineSync()!);

  List<Map<String, dynamic>> daftarMahasiswa = [];

  for (int i = 0; i < jumlah; i++) {
    print("\n--- Mahasiswa ke-${i + 1} ---");

    stdout.write("Masukkan NIM: ");
    String nim = stdin.readLineSync()!;

    stdout.write("Masukkan Nama: ");
    String nama = stdin.readLineSync()!;

    stdout.write("Masukkan Jurusan: ");
    String jurusan = stdin.readLineSync()!;

    stdout.write("Masukkan IPK: ");
    String ipk = stdin.readLineSync()!;

    Map<String, dynamic> mhs = {
      'nim': nim,
      'nama': nama,
      'jurusan': jurusan,
      'ipk': double.parse(ipk),
    };

    daftarMahasiswa.add(mhs);
  }

  // TAMPILKAN SEMUA DATA MULTIPLE
  print("\n=== DATA SEMUA MAHASISWA ===");
  for (var mhs in daftarMahasiswa) {
    print(mhs);
  }
}

// dart run lib/modul_2/map2.dart