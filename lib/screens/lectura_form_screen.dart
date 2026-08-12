import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;
import '../data/database.dart';

class LecturaFormScreen extends StatefulWidget {
  final AppDatabase database;
  final Lectura lectura;

  const LecturaFormScreen({
    super.key,
    required this.database,
    required this.lectura,
  });

  @override
  State<LecturaFormScreen> createState() => _LecturaFormScreenState();
}

class _LecturaFormScreenState extends State<LecturaFormScreen> {
  late TextEditingController _valorController;
  late TextEditingController _observacionController;

  @override
  void initState() {
    super.initState();
    _valorController = TextEditingController(
      text: widget.lectura.valorActual?.toString() ?? '',
    );
    _observacionController = TextEditingController(
      text: widget.lectura.observacion,
    );
  }

  @override
  void dispose() {
    _valorController.dispose();
    _observacionController.dispose();
    super.dispose();
  }

  Future<void> _guardar() async {
    final valor = double.tryParse(_valorController.text);
    if (valor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingresa un valor numerico valido')),
      );
      return;
    }

    await (widget.database.update(widget.database.lecturas)
      ..where((l) => l.id.equals(widget.lectura.id)))
      .write(
        LecturasCompanion(
          valorActual: Value(valor),
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
      appBar: AppBar(title: Text(lectura.medidor)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(lectura.direccion, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('Valor anterior: ${lectura.valorAnterior}'),
            const SizedBox(height: 16),
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor actual',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _observacionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Observación',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
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