import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;
import '../data/database.dart';

class LecturaFormScreen extends StatefulWidget {
  final AppDatabase database;
  final Lectura lectura;
  final List<String> opcionesNlLc;

  const LecturaFormScreen({
    super.key,
    required this.database,
    required this.lectura,
    required this.opcionesNlLc,
  });

  @override
  State<LecturaFormScreen> createState() => _LecturaFormScreenState();
}

class _LecturaFormScreenState extends State<LecturaFormScreen> {
  String? _opcionSeleccionada;
  late TextEditingController _observacionController;

  @override
  void initState() {
    super.initState();
    _opcionSeleccionada = widget.lectura.nlLc;
    _observacionController = TextEditingController(
      text: widget.lectura.observacion,
    );
  }

  @override
  void dispose() {
    _observacionController.dispose();
    super.dispose();
  }

  Future<void> _guardar() async {
    if (_opcionSeleccionada == null || _opcionSeleccionada!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona una opcion NL/CL')),
      );
      return;
    }

    await (widget.database.update(widget.database.lecturas)
      ..where((l) => l.id.equals(widget.lectura.id)))
      .write(
        LecturasCompanion(
          nlLc: Value(_opcionSeleccionada),
          observacion: Value(_observacionController.text),
        ),
      );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final lectura = widget.lectura;

    return Scaffold(
      appBar: AppBar(title: Text(lectura.codigo)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lectura.descripcion ?? 'Sin descripcion',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('Serie: ${lectura.serie ?? "Sin registro"}'),
            const SizedBox(height: 4),
            Text('Lectura anterior: ${lectura.lectAnt ?? "Sin registro"}'),
            // Text('Consumo anterior: ${lectura.consAnt ?? "Sin registro"}'),
            const SizedBox(height: 16),

            // Select (Dropdown) de Opciones NL/LC
            DropdownButtonFormField<String>(
              initialValue: widget.opcionesNlLc.contains(_opcionSeleccionada)
                  ? _opcionSeleccionada
                  : null,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Anomalía / Novedad (NL/LC)',
                border: OutlineInputBorder(),
              ),
              hint: const Text('Seleccione una opción'),
              items: widget.opcionesNlLc.map((opcion) {
                return DropdownMenuItem<String>(
                  value: opcion,
                  child: Text(
                    opcion,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (nuevoValor) {
                setState(() {
                  _opcionSeleccionada = nuevoValor;
                });
              },
            ),
            const SizedBox(height: 16),

            // Campo de Observación
            TextField(
              controller: _observacionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Observación',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Botón Guardar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _guardar,
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}