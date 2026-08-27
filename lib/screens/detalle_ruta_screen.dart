import 'package:flutter/material.dart';
import '../data/database.dart';
import '../data/sync_service.dart';
import 'lectura_form_screen.dart';

class DetalleRutaScreen extends StatelessWidget {
  final AppDatabase database;
  final Ruta ruta;

  const DetalleRutaScreen({
    super.key,
    required this.database,
    required this.ruta,
  });

  @override
  Widget build(BuildContext context) {
    final syncService = SyncService(database);

    return Scaffold(
      appBar: AppBar(title: Text(ruta.nombre)),
      body: StreamBuilder<List<Lectura>>(
        stream: (database.select(database.lecturas)
          ..where((l) => l.rutaId.equals(ruta.id)))
          .watch(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final lecturas = snapshot.data!;
          final todasCompletas = lecturas.every((l) => l.nlLc != null && l.nlLc!.isNotEmpty);

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: lecturas.length,
                  itemBuilder: (context, index) {
                    final lectura = lecturas[index];
                    final completada = lectura.nlLc != null;

                    return ListTile(
                      leading: Icon(
                        completada ? Icons.check_circle : Icons.check_circle_outlined,
                        color: completada ? Colors.green : Colors.grey,
                      ),
                      title: Text(lectura.codigo),
                      subtitle: Text(lectura.descripcion.toString()),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LecturaFormScreen(
                              database: database,
                              lectura: lectura,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: todasCompletas
                      ? () async {
                        // Marcar de manera local
                        await syncService.marcarRutaCompleta(ruta.id);

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Ruta marcada como completa'),
                            ),
                          );
                        }

                        // Intenta sincronizar (si falla no rompe nada)
                        final sincronizado = await syncService.sincronizarPendientes();

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                sincronizado
                                  ? 'Ruta sincronizada con exito'
                                  : 'Sin conexion: se sincronizara mas tarde',
                              ),
                            ),
                          );
                        }
                      }
                      : null,
                    child: const Text('Marcar ruta como completa'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}