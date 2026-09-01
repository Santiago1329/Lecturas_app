import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show OrderingTerm, OrderingMode;
import '../data/database.dart';
import '../data/sync_service.dart';
import 'lectura_form_screen.dart';

class DetalleRutaScreen extends StatefulWidget {
  final AppDatabase database;
  final Ruta ruta;

  const DetalleRutaScreen({
    super.key,
    required this.database,
    required this.ruta,
  });

  @override
  State<DetalleRutaScreen> createState() => _DetalleRutaScreenState();
}

class _DetalleRutaScreenState extends State<DetalleRutaScreen> {
  String _busqueda = '';

  @override
  Widget build(BuildContext context) {
    final syncService = SyncService(widget.database);

    return Scaffold(
      appBar: AppBar(title: Text(widget.ruta.nombre)),
      body: StreamBuilder<List<Lectura>>(
        stream: (widget.database.select(widget.database.lecturas)
          ..where((l) => l.rutaId.equals(widget.ruta.id))
          ..orderBy([
            (l) => OrderingTerm(
              expression: l.nlLc.isNull(),
              mode: OrderingMode.desc,
            ),
            (l) => OrderingTerm(expression: l.id)
          ]))
          .watch(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final lecturas = snapshot.data!;
          final todasCompletas = lecturas.every((l) => l.nlLc != null && l.nlLc!.isNotEmpty);
          final lecturasFiltradas = _busqueda.isEmpty
            ? lecturas
            : lecturas
              .where((l) => l.codigo.toLowerCase().contains(_busqueda.toLowerCase()))
              .toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Buscar por código',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (valor) => setState(() => _busqueda = valor),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: lecturasFiltradas.length,
                  itemBuilder: (context, index) {
                    final lectura = lecturasFiltradas[index];
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
                              database: widget.database,
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
                        await syncService.marcarRutaCompleta(widget.ruta.id);

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