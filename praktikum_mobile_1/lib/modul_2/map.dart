import 'dart:io';

void main() {
  // Membuat Map dengan data awal
  Map<String, String> data = {
    'Anang': '081234567890',
    'Arman': '082345678901',
    'Doni': '083456789012',
  };

  print('Data: $data');

    // Menambahkan data ke Map
  data['Rio'] = '084567890123';
  print('Data setelah ditambahkan: $data');

    // Mengakses data berdasarkan key
  print('Nomor Anang: ${data['Anang']}');

  // UBAH DATA
  data['Arman'] = '089999999999';
  print('\nData setelah Arman diubah: $data');

  // HAPUS DATA
  data.remove('Doni');
  print('\nData setelah Doni dihapus: $data');

  // CEK DATA BERDASARKAN KEY
  if (data.containsKey('Anang')) {
    print('\nKey "Anang" ada di Map');
  } else {
    print('\nKey "Anang" tidak ada di Map');
  }

  // HITUNG JUMLAH DATA
  print('\nJumlah data: ${data.length}');

  // TAMPILKAN SEMUA KEY
  print('\nDaftar Semua Key:');
  data.keys.forEach((key) {
    print(key);
  });

  // TAMPILKAN SEMUA VALUE
  print('\nDaftar Semua Value:');
  data.values.forEach((value) {
    print(value);
  });
}

// dart run lib/modul_2/map.dart