import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'dashboard_provider.dart';

import 'package:praktikum_mobile_1/features/dosen/presentation/pages/dosen_page.dart';
import 'package:praktikum_mobile_1/features/mahasiswa/presentation/pages/mahasiswa_page.dart';
import 'package:praktikum_mobile_1/features/mahasiswa_aktif/presentation/pages/mahasiswa_aktif_page.dart';
import 'package:praktikum_mobile_1/features/matkul/presentation/pages/matkul_page.dart';
import 'package:praktikum_mobile_1/features/profile/presentation/pages/profile_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboard = Provider.of<DashboardProvider>(context);

    final now = DateTime.now();
    final formattedDate = DateFormat('d MMM yyyy, HH:mm').format(now);

    return Scaffold(
      body: Column(
        children: [
          /// HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF4A90E2),
                  Color(0xFF357ABD),
                ],
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Selamat Datang 👋",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Admin D4TI",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    /// NOTIFICATION BUTTON
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        "Update: $formattedDate",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// STATISTIK
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Statistik",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.refresh, size: 18),
                    SizedBox(width: 5),
                    Text("Refresh")
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// GRID MENU
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.05,
              children: [
                dashboardCard(
                  context,
                  icon: Icons.school,
                  title: "Mahasiswa",
                  value: dashboard.totalMahasiswa.toString(),
                  colors: const [
                    Color(0xFF6A82FB),
                    Color(0xFF8F5FE8),
                  ],
                  page: const MahasiswaPage(),
                ),
                dashboardCard(
                  context,
                  icon: Icons.person,
                  title: "Mahasiswa Aktif",
                  value: "550",
                  colors: const [
                    Color(0xFFFF758C),
                    Color(0xFFFF7EB3),
                  ],
                  page: const MahasiswaAktifPage(),
                ),
                dashboardCard(
                  context,
                  icon: Icons.groups,
                  title: "Dosen",
                  value: dashboard.totalDosen.toString(),
                  colors: const [
                    Color(0xFF36D1DC),
                    Color(0xFF5B86E5),
                  ],
                  page: const DosenPage(),
                ),
                dashboardCard(
                  context,
                  icon: Icons.menu_book,
                  title: "Mata Kuliah",
                  value: dashboard.totalMatkul.toString(),
                  colors: const [
                    Color(0xFF56CCF2),
                    Color(0xFF2F80ED),
                  ],
                  page: const MatkulPage(),
                ),
                dashboardCard(
                  context,
                  icon: Icons.person_outline,
                  title: "Profile",
                  value: "1",
                  colors: const [
                    Color(0xFFFF9966),
                    Color(0xFFFF5E62),
                  ],
                  page: const ProfilePage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dashboardCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required List<Color> colors,
    required Widget page,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: colors),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: Stack(
            children: [
              /// circle kanan atas
              Positioned(
                right: -30,
                top: -30,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.15),
                  ),
                ),
              ),

              /// circle kiri bawah
              Positioned(
                left: -40,
                bottom: -40,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.12),
                  ),
                ),
              ),

              /// CONTENT
              Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    /// icon
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(icon, color: Colors.white, size: 20),
                      ),
                    ),

                    /// value text
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
