import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usuarioController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool ocultarPassword = true;

  final Color naranja = const Color(0xFFFF681C);
  final Color gris = const Color(0xFFCDD5DC);

  @override
  void dispose() {
    usuarioController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void iniciarSesion() {
    String usuario = usuarioController.text;
    String password = passwordController.text;

    if (usuario.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingresa tu usuario y contraseña')),
      );
      return;
    }

    // Aquí puedes agregar la lógica de autenticación.
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Iniciando sesión...')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomPaint(
        painter: FondoPunteado(),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: Container(
                  width: constraints.maxWidth * 0.80,
                  height: constraints.maxHeight * 0.95,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blueGrey, width: 1),
                  ),
                  child: Column(
                    children: [
                      // Barra superior
                      Container(
                        height: 22,
                        width: double.infinity,
                        color: gris,
                      ),

                      // Contenido principal
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Logo de la aplicación
                              const Text(
                                'LOGO DE LA\nAPP',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 21,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                              const SizedBox(height: 34),

                              // Campo de usuario
                              TextField(
                                controller: usuarioController,
                                decoration: InputDecoration(
                                  hintText: 'Usuario',
                                  hintStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.blueGrey,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 9,
                                    vertical: 12,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: naranja,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: naranja,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 13),

                              // Campo de contraseña
                              TextField(
                                controller: passwordController,
                                obscureText: ocultarPassword,
                                decoration: InputDecoration(
                                  hintText: 'Contraseña',
                                  hintStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.blueGrey,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 9,
                                    vertical: 12,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: naranja,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: naranja,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Botón iniciar sesión
                              SizedBox(
                                width: 123,
                                height: 36,
                                child: ElevatedButton(
                                  onPressed: iniciarSesion,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: naranja,
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  child: const Text(
                                    'Iniciar sesión',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Barra inferior
                      Container(
                        height: 32,
                        width: double.infinity,
                        color: gris,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Fondo con puntos decorativos
class FondoPunteado extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE6EBEF)
      ..style = PaintingStyle.fill;

    const double separacion = 9;

    for (double x = 4; x < size.width; x += separacion) {
      for (double y = 4; y < size.height; y += separacion) {
        canvas.drawCircle(Offset(x, y), 1.2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
