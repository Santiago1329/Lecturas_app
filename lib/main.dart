import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'data/database.dart';
import 'data/sync_service.dart';
import 'screens/rutas_list_screen.dart';
import 'screens/pin_login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    publishableKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  final database = AppDatabase();
  SyncService(database).escucharConectividad();

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;
  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    final sesionActiva = Supabase.instance.client.auth.currentSession != null;

    return MaterialApp(
      title: 'Rutas Demo',
      home: sesionActiva
        ? RutasListScreen(database: database)
        : PinLoginScreen(database: database),
    );
  }
}
