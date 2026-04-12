import 'dart:io';

void main() {
  List<String> names = ['Ash', 'Bianca', 'Carmen'];
  print('Names: $names');

  // Menambahkan data dalam list
  names.add('Dexter');
  print('Names setelah ditambahkan: $names');

  //Mengambil data index tertentu
  print('Elemen pertama: ${names[0]}');
  print('Elemen kedua: ${names[1]}');

  // Mengubah data pada index tertentu
  names[1] = 'Bella';
  print('Names setelah diubah: $names');

  // Menghapus data dari list
  names.remove('Carmen');
  print('Names setelah dihapus: $names');

  // Menghitung jumlah data dalam list
  print('Jumlah data: ${names.length}');

  //Looping data list
  print('Menampilkan setiap elemen:');
  for (String name in names) {
    print(name);
  }

  //Membuat list kosong
  List<String> dataList = [];
  print('Data List kosong: $dataList');

  // Mengambil jumlah data dari pengguna
  int count = 0;
  while (count <= 0) {
    stdout.write('Masukkan jumlah list: ');
    String? input = stdin.readLineSync();
    try {
      count = int.parse(input!);
      if (count <= 0) {
        print('Jumlah harus lebih dari 0. Silakan coba lagi.');
      }
    } catch (e) {
      print('Input tidak valid. Silakan masukkan angka yang benar.');
    }
  }

  // Memasukkan data ke dalam list menggunakan for loop
  for (int i = 0; i < count; i++) {
    stdout.write('Masukkan data ke-${i + 1}: ');
    String x = stdin.readLineSync()!;
    dataList.add(x);
  }

  // Menampilkan data yang telah dimasukkan
  print('Data yang dimasukkan: $dataList');
}

// dart run lib/modul_2/list.dart