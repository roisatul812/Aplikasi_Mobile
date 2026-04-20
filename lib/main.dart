import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider;

import 'package:praktikum_mobile_1/features/dashboard/dashboard_provider.dart';
import 'package:praktikum_mobile_1/features/dashboard/dashboard_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: provider.ChangeNotifierProvider(
        create: (_) => DashboardProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}