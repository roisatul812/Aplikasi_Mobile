import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  /// 🔑 KEY STORAGE (DIPISAH)
  static const String _dosenKey = "saved_dosen";
  static const String _mahasiswaKey = "saved_mahasiswa";
  static const String _mahasiswaAktifKey = "saved_mahasiswa_aktif";

  /// 🔧 HELPER
  Future<List<String>> _getList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  Future<void> _setList(String key, List<String> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, data);
  }

  List<Map<String, dynamic>> _decode(List<String> data) {
    return data.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
  }

  String _encode(Map<String, dynamic> data) {
    return jsonEncode(data);
  }

  /// 📚 DOSEN
  Future<void> saveDosen(Map<String, dynamic> user) async {
    final list = await _getList(_dosenKey);
    list.add(_encode(user));
    await _setList(_dosenKey, list);
  }

  Future<List<Map<String, dynamic>>> getDosen() async {
    final list = await _getList(_dosenKey);
    return _decode(list);
  }

  Future<void> removeDosen(int id) async {
    final list = await _getList(_dosenKey);

    list.removeWhere((e) {
      final data = jsonDecode(e);
      return data['id'] == id;
    });

    await _setList(_dosenKey, list);
  }

  Future<void> clearDosen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_dosenKey);
  }

  /// 🎓 MAHASISWA
  Future<void> saveMahasiswa(Map<String, dynamic> user) async {
    final list = await _getList(_mahasiswaKey);
    list.add(_encode(user));
    await _setList(_mahasiswaKey, list);
  }

  Future<List<Map<String, dynamic>>> getMahasiswa() async {
    final list = await _getList(_mahasiswaKey);
    return _decode(list);
  }

  Future<void> removeMahasiswa(int id) async {
    final list = await _getList(_mahasiswaKey);

    list.removeWhere((e) {
      final data = jsonDecode(e);
      return data['id'] == id;
    });

    await _setList(_mahasiswaKey, list);
  }

  Future<void> clearMahasiswa() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_mahasiswaKey);
  }

  /// 🟢 MAHASISWA AKTIF
  Future<void> saveMahasiswaAktif(Map<String, dynamic> user) async {
    final list = await _getList(_mahasiswaAktifKey);
    list.add(_encode(user));
    await _setList(_mahasiswaAktifKey, list);
  }

  Future<List<Map<String, dynamic>>> getMahasiswaAktif() async {
    final list = await _getList(_mahasiswaAktifKey);
    return _decode(list);
  }

  Future<void> removeMahasiswaAktif(int id) async {
    final list = await _getList(_mahasiswaAktifKey);

    list.removeWhere((e) {
      final data = jsonDecode(e);
      return data['id'] == id;
    });

    await _setList(_mahasiswaAktifKey, list);
  }

  Future<void> clearMahasiswaAktif() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_mahasiswaAktifKey);
  }
}
