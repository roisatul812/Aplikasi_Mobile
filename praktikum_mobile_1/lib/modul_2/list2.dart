import 'dart:io';

void main() {
  List<String> dataList = [];
  print("=== INPUT DATA LIST ===");

  // Input jumlah data
  stdout.write("Masukkan jumlah data: ");
  int jumlah = int.parse(stdin.readLineSync()!);

  // Input data
  for (int i = 0; i < jumlah; i++) {
    stdout.write("Data ke-${i + 1}: ");
    String input = stdin.readLineSync()!;
    dataList.add(input);
  }

  print("\nData awal: $dataList");

  // TAMPIL BERDASARKAN INDEX
  stdout.write("\nMasukkan index yang ingin ditampilkan: ");
  int indexTampil = int.parse(stdin.readLineSync()!);

  if (indexTampil >= 0 && indexTampil < dataList.length) {
    print("Data pada index $indexTampil: ${dataList[indexTampil]}");
  } else {
    print("Index tidak valid!");
  }

  // UBAH DATA BERDASARKAN INDEX
  stdout.write("\nMasukkan index yang ingin diubah: ");
  int indexUbah = int.parse(stdin.readLineSync()!);

  if (indexUbah >= 0 && indexUbah < dataList.length) {
    stdout.write("Masukkan data baru: ");
    String dataBaru = stdin.readLineSync()!;
    dataList[indexUbah] = dataBaru;
    print("Data berhasil diubah!");
  } else {
    print("Index tidak valid!");
  }

  // HAPUS DATA BERDASARKAN INDEX
  stdout.write("\nMasukkan index yang ingin dihapus: ");
  int indexHapus = int.parse(stdin.readLineSync()!);

  if (indexHapus >= 0 && indexHapus < dataList.length) {
    dataList.removeAt(indexHapus);
    print("Data berhasil dihapus!");
  } else {
    print("Index tidak valid!");
  }

  // TAMPILKAN HASIL AKHIR
  print("\n=== SEMUA DATA ===");
  for (int i = 0; i < dataList.length; i++) {
    print("Index $i: ${dataList[i]}");
  }
}


// dart run lib/modul_2/list2.dart