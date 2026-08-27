import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;
import '../data/database.dart';
import '../data/opciones_nl_lc.dart';

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
  late TextEditingController _lectRevController;
  late TextEditingController _observacionController;
  String? _nlLcSeleccionado;

  @override
  void initState() {
    super.initState();
    _lectRevController = TextEditingController(
      text: widget.lectura.lectRev?.toString() ?? ''
    );
    _observacionController = TextEditingController(
      text: widget.lectura.observacion,
    );
    _nlLcSeleccionado = widget.lectura.nlLc;
  }

  @override
  void dispose() {
    _lectRevController.dispose();
    _observacionController.dispose();
    super.dispose();
  }

  Future<void> _guardar() async {
    final lectRev = double.tryParse(_lectRevController.text);

    await (widget.database.update(widget.database.lecturas)
      ..where((l) => l.id.equals(widget.lectura.id)))
      .write(
        LecturasCompanion(
          lectRev: Value(lectRev),
          nlLc: Value(_nlLcSeleccionado),
          observacion: Value(_observacionController.text),
        ),
      );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  void _mostrarDetalles() {
    final l = widget.lectura;
    showModalBottomSheet(
      context: context, 
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Detalles', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            _filaDetalle('Nombre_cliente', l.nombreCliente ?? '-'),
            _filaDetalle('Direccion', l.direccion ?? '-'),
            _filaDetalle('Cons. Anterior', l.consAnt?.toString() ?? '-'),
            _filaDetalle('Cons. Actual', l.consAct?.toString() ?? '-'),
          ],
        ),
      )
    );
  }

  Widget _filaDetalle(String label, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: Colors.grey))),
          Expanded(child: Text(valor, textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lectura = widget.lectura;

    return Scaffold(
      appBar: AppBar(
        title: Text(lectura.codigo, style: const TextStyle(fontSize: 26)),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, size: 30),
            onPressed: _mostrarDetalles,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _campoVisible('Lectura anterior', lectura.lectAnt?.toString() ?? '-'),
            _campoVisible('Lectura actual', lectura.lectAct?.toString() ?? '-'),
            _campoVisible('Descripcion', lectura.descripcion ?? '-'),
            _campoVisible('Promedio', lectura.promedio?.toString() ?? '-'),
            _campoVisible('Serie', lectura.serie ?? '-'),

            const Divider(height: 40, thickness: 2),

            // Revsision de lectura
            const Text('Lectura revisada',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _lectRevController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              style: const TextStyle(fontSize: 24),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              ),
            ),
            const SizedBox(height: 24),

            // Opciones NL/LC
            const Text('NL / LC',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _nlLcSeleccionado,
              isExpanded: true,
              style: const TextStyle(fontSize: 18, color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              ),
              items: opcionesNlLc
                  .map((op) => DropdownMenuItem(value: op, child: Text(op)))
                  .toList(),
              onChanged: (valor) => setState(() => _nlLcSeleccionado = valor),
            ),
            const SizedBox(height: 24),

            // Observacion
            const Text('Observación',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _observacionController,
              maxLines: 3,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 32),

            // Botón Guardar
            SizedBox(
              width: double.infinity,
              height: 64,
              child: ElevatedButton(
                onPressed: _guardar,
                child: const Text('Guardar', style: TextStyle(fontSize: 22)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _campoVisible(String label, String valor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label,
                style: const TextStyle(fontSize: 18, color: Colors.grey)),
          ),
          Expanded(
            flex: 3,
            child: Text(valor,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}