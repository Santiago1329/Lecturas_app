import 'package:flutter/material.dart';
import 'data/database.dart';
import 'screens/rutas_list_screen.dart';

void main() {
  runApp(MyApp(database: AppDatabase()));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;
  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rutas Demo',
      home: RutasListScreen(database: database),
    );
  }
}
