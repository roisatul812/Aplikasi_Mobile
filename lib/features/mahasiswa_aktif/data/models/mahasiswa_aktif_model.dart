class MahasiswaAktifModel {
  final int id;
  final String name;
  final String email;
  final String body;

  MahasiswaAktifModel({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaAktifModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['company']['catchPhrase'], // biar ada isi tambahan
    );
  }
}