import 'package:flutter/material.dart';
import '../../data/models/dosen_model.dart';

class DosenCard extends StatelessWidget {
  final Dosen dosen;
  final List<Color> gradientColors;

  const DosenCard({
    super.key,
    required this.dosen,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {

    final firstLetter = dosen.nama[0];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [

          /// AVATAR HURUF
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                firstLetter,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          /// DATA DOSEN
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  dosen.nama,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "NIP: ${dosen.nip}",
                  style: const TextStyle(color: Colors.white70),
                ),

                Text(
                  dosen.email,
                  style: const TextStyle(color: Colors.white70),
                ),

                Text(
                  dosen.jurusan,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 18,
          ),
        ],
      ),
    );
  }
}