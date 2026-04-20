mixin Mengajar {
  void mengajar() {
    print("Sedang mengajar mahasiswa");
  }
}

mixin Penelitian {
  void penelitian() {
    print("Melakukan penelitian");
  }
}

mixin Administrasi {
  void administrasi() {
    print("Mengurus administrasi kampus");
  }
}

class Dosen with Mengajar, Penelitian, Administrasi {}

void main() {
  var dosen = Dosen();

  dosen.mengajar();
  dosen.penelitian();
  dosen.administrasi();
}