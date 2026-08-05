import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;
import '../data/database.dart';
import 'detalle_ruta_screen.dart';

class RutasListScreen extends StatefulWidget {
  final AppDatabase database;
  const RutasListScreen({super.key, required this.database});

  @override
  State<RutasListScreen> createState() => _RutasListScreenState();
}

class _RutasListScreenState extends State<RutasListScreen> {
  @override
  void initState() {
    super.initState();
    _sembrarDatosSiEstaVacio();
  }

  Future<void> _sembrarDatosSiEstaVacio() async {
    final existentes = await widget.database.select(widget.database.rutas).get();
    if (existentes.isEmpty) {
      final rutaId = await widget.database.into(widget.database.rutas).insert(
            RutasCompanion(nombre: Value('Ruta Centro')),
          );
      await widget.database.into(widget.database.lecturas).insert(
            LecturasCompanion(
              rutaId: Value(rutaId),
              medidor: Value('M-001'),
              direccion: Value('Calle 10 #5-20'),
              valorAnterior: Value(1200),
            ),
          );
      await widget.database.into(widget.database.lecturas).insert(
            LecturasCompanion(
              rutaId: Value(rutaId),
              medidor: Value('M-002'),
              direccion: Value('Calle 10 #5-25'),
              valorAnterior: Value(950),
            ),
          );

      final rutaId2 = await widget.database.into(widget.database.rutas).insert(
            RutasCompanion(nombre: Value('Ruta Norte')),
          );
      await widget.database.into(widget.database.lecturas).insert(
            LecturasCompanion(
              rutaId: Value(rutaId2),
              medidor: Value('M-101'),
              direccion: Value('Cra 45 #12-08'),
              valorAnterior: Value(430),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Rutas')),
      body: StreamBuilder<List<Ruta>>(
        stream: widget.database.select(widget.database.rutas).watch(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final rutas = snapshot.data!;

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
    );
  }
}