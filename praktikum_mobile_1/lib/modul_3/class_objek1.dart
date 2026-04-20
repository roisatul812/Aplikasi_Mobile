class Mahasiswa {
  String nama = "Anang";

  void tampilkanData() {
    print("Nama Mahasiswa: $nama");
  }
}

void main() {
  var mahasiswa = Mahasiswa();
  mahasiswa.tampilkanData();
}