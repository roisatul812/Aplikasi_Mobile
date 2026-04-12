import 'dart:io';

void main() {
  Set<String> dataSet = {};

  // INPUT DATA AWAL
  stdout.write("Masukkan jumlah data: ");
  int jumlah = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < jumlah; i++) {
    stdout.write("Data ke-${i + 1}: ");
    String input = stdin.readLineSync()!;
    dataSet.add(input);
  }

  // TAMPILKAN SEMUA DATA
  print("\n=== SEMUA DATA ===");
  int no = 1;
  for (var data in dataSet) {
    print("$no. $data");
    no++;
  }

  print("Total data: ${dataSet.length}");

  // TAMBAH DATA
  stdout.write("\nMasukkan data baru: ");
  String dataBaru = stdin.readLineSync()!;

  if (dataSet.add(dataBaru)) {
    print('Data "$dataBaru" berhasil ditambahkan!');
  } else {
    print('Data "$dataBaru" sudah ada di Set!');
  }

  // HAPUS DATA
  stdout.write("\nMasukkan data yang ingin dihapus: ");
  String dataHapus = stdin.readLineSync()!;

  if (dataSet.remove(dataHapus)) {
    print('Data "$dataHapus" berhasil dihapus!');
  } else {
    print('Data "$dataHapus" tidak ditemukan!');
  }

  // CEK DATA
  stdout.write("\nMasukkan data yang ingin dicek: ");
  String dataCek = stdin.readLineSync()!;

  if (dataSet.contains(dataCek)) {
    print('Data "$dataCek" ada di Set!');
  } else {
    print('Data "$dataCek" tidak ada di Set!');
  }
}

// dart run lib/modul_2/set2.dart