import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/database.dart';
import '../data/sync_service.dart';
import 'detalle_ruta_screen.dart';

class RutasListScreen extends StatefulWidget {
  final AppDatabase database;
  const RutasListScreen({super.key, required this.database});

  @override
  State<RutasListScreen> createState() => _RutasListScreenState();
}

class _RutasListScreenState extends State<RutasListScreen> {

  @override
  Widget build(BuildContext context) {
    final syncService = SyncService(widget.database);

    return Scaffold(
      appBar: AppBar(title: const Text('Mis Rutas')),
      body: StreamBuilder<List<Ruta>>(
        stream: widget.database.select(widget.database.rutas).watch(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final rutas = snapshot.data!;

          if (rutas.isEmpty) {
            return const Center(
              child: Text('No tienes rutas descargadas todavia'),
            );
          }

          return ListView.builder(
            itemCount: rutas.length,
            itemBuilder: (context, index) {
              final ruta = rutas[index];

              return ListTile(
                title: Text(ruta.nombre),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalleRutaScreen(
                        database: widget.database,
                        ruta: ruta,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final lectorId = Supabase.instance.client.auth.currentUser!.id;
          final huboDescarga = await syncService.descargarRutaAsignada(lectorId);
          
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  huboDescarga
                    ? 'Ruta nueva descargada'
                    : 'No hay rutas nuevas o no hay conexion',
                ),
              ),
            );
          }
        }, 
        label: const Text('Descargar ruta'),
        icon: const Icon(Icons.download),
      ),
    );
  }
}