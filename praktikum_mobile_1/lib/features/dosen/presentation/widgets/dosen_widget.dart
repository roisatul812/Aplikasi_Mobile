import 'package:flutter/material.dart';
import '../../data/models/dosen_model.dart';

class DosenCard extends StatelessWidget {

  final DosenModel dosen;
  final List<Color>? gradientColors;

  const DosenCard({
    super.key,
    required this.dosen,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {

    final colors = gradientColors ??
        [
          Colors.blue,
          Colors.purple
        ];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors[0].withOpacity(0.15),
            colors[1].withOpacity(0.15)
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colors[0].withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0,4),
          )
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Row(
          children: [

            /// AVATAR
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colors,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  dosen.name.substring(0,1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 14),

            /// DATA DOSEN
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    dosen.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text("@${dosen.username}"),

                  Text(dosen.email),

                  Text(
                    "${dosen.address.street}, ${dosen.address.city}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                ],
              ),
            ),

            /// ARROW
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colors[0].withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: colors[0],
              ),
            ),

          ],
        ),
      ),
    );
  }
}