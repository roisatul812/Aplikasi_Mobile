class Mahasiswa {
  String nama;

  Mahasiswa(this.nama);

  void info() {
    print("Nama Mahasiswa: $nama");
  }
}

class MahasiswaAktif extends Mahasiswa {
  int semester;

  MahasiswaAktif(String nama, this.semester) : super(nama);

  void tampilSemester() {
    print("Semester: $semester");
  }
}

class MahasiswaAlumni extends Mahasiswa {
  int tahunLulus;

  MahasiswaAlumni(String nama, this.tahunLulus) : super(nama);

  void tampilTahunLulus() {
    print("Tahun Lulus: $tahunLulus");
  }
}

void main() {
  var mhsAktif = MahasiswaAktif("Anang", 4);
  mhsAktif.info();
  mhsAktif.tampilSemester();

  print("");

  var mhsAlumni = MahasiswaAlumni("Budi", 2023);
  mhsAlumni.info();
  mhsAlumni.tampilTahunLulus();
}