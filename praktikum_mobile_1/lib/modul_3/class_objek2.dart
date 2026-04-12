class Mahasiswa {
  String nama;
  String nim;
  String jurusan;

  Mahasiswa(this.nama, this.nim, this.jurusan);

  void tampilkanData() {
    print("Nama: $nama");
    print("NIM: $nim");
    print("Jurusan: $jurusan");
  }
}

void main() {
  var mahasiswa1 = Mahasiswa(
    "Anang",
    "2024001",
    "Teknik Informatika",
  );

  mahasiswa1.tampilkanData();
}