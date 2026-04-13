import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard_provider.dart';

import 'package:praktikum_mobile_1/features/dosen/presentation/pages/dosen_page.dart';
import 'package:praktikum_mobile_1/features/mahasiswa/presentation/pages/mahasiswa_page.dart';
import 'package:praktikum_mobile_1/features/mahasiswa_aktif/presentation/pages/mahasiswa_aktif_page.dart';
import 'package:praktikum_mobile_1/features/profile/presentation/pages/profile_page.dart';
import 'package:praktikum_mobile_1/features/matkul/presentation/pages/matkul_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboard = Provider.of<DashboardProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Mahasiswa
            dashboardCard(
              icon: Icons.school,
              title: "Mahasiswa",
              total: dashboard.totalMahasiswa,
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MahasiswaPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            /// Dosen
            dashboardCard(
              icon: Icons.person,
              title: "Dosen",
              total: dashboard.totalDosen,
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const DosenPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            /// Mata Kuliah
            dashboardCard(
  icon: Icons.menu_book,
  title: "Mata Kuliah",
  total: dashboard.totalMatkul,
  color: Colors.orange,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const MatkulPage(),
      ),
    );
  },
),

            const SizedBox(height: 16),

            /// Mahasiswa Aktif
            dashboardCard(
              icon: Icons.people,
              title: "Mahasiswa Aktif",
              total: 100,
              color: Colors.purple,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MahasiswaAktifPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            /// Profile
            dashboardCard(
              icon: Icons.person_outline,
              title: "Profile",
              total: 1,
              color: Colors.teal,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfilePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardCard({
    required IconData icon,
    required String title,
    required int total,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color),
          ),
          title: Text(title),
          subtitle: Text(
            "Total: $total",
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
