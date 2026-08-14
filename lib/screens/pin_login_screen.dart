import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/database.dart';
import 'rutas_list_screen.dart';

class PinLoginScreen extends StatefulWidget {
  final AppDatabase database;
  const PinLoginScreen({super.key, required this.database});

  @override
  State<PinLoginScreen> createState() => _PinLoginScreenState();
}

class _PinLoginScreenState extends State<PinLoginScreen> {
  final _pinController = TextEditingController();
  bool _cargando = false;
  String? _error;

  Future<void> _login() async {
    setState(() {
      _cargando = true;
      _error = null;
    });

    final pin = _pinController.text.trim();
    final supabase = Supabase.instance.client;

    try {
      final email = await supabase.rpc(
        'login_con_pin',
        params: {'pin_ingresado': pin},
      );

      if (email == null) {
        setState(() {
          _error = 'PIN incorrecto';
          _cargando = false;
        });
        return;
      }

      await supabase.auth.signInWithPassword(email: email, password: pin);

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RutasListScreen(database: widget.database),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _error = 'No se pudo iniciar sesión. Revisa tu conexión.';
        _cargando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Ingresa tu PIN', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 24),
              TextField(
                controller: _pinController,
                keyboardType: TextInputType.number,
                obscureText: true,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 28, letterSpacing: 8),
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              if (_error != null) ...[
                const SizedBox(height: 12),
                Text(_error!, style: const TextStyle(color: Colors.red)),
              ],
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _cargando ? null : _login, 
                  child: _cargando
                    ? const CircularProgressIndicator()
                    : const Text('Ingresar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}