import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';

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
            dashboardCard(
              icon: Icons.school,
              title: "Mahasiswa",
              total: dashboard.totalMahasiswa,
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
            dashboardCard(
              icon: Icons.person,
              title: "Dosen",
              total: dashboard.totalDosen,
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            dashboardCard(
              icon: Icons.menu_book,
              title: "Mata Kuliah",
              total: dashboard.totalMatkul,
              color: Colors.orange,
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
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
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
    );
  }
}
