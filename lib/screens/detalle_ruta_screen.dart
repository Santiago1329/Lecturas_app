import 'package:flutter/material.dart';
import '../data/database.dart';
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
          final todasCompletas = lecturas.every((l) => l.valorActual != null);

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: lecturas.length,
                  itemBuilder: (context, index) {
                    final lectura = lecturas[index];
                    final completada = lectura.valorActual != null;

                    return ListTile(
                      leading: Icon(
                        completada ? Icons.check_circle : Icons.check_circle_outlined,
                        color: completada ? Colors.green : Colors.grey,
                      ),
                      title: Text(lectura.medidor),
                      subtitle: Text(lectura.direccion),
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
                      ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Ruta marcada como completa(simulado)'),
                          ),
                        );
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