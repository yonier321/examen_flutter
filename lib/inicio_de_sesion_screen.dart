// Archivo: lib/inicio_de_sesion_screen.dart

import 'package:flutter/material.dart';

// Cuando tu compañero suba su archivo de Catálogo, descomentas la siguiente línea:
// import 'catalogo_screen.dart';

class InicioDeSesionScreen extends StatelessWidget {
  const InicioDeSesionScreen({Key? key}) : super(key: key);

  static const Color primaryRed = Color(0xFFEC1313);

  // Transición de animación entre pantallas (Slide horizontal)
  PageRouteBuilder _crearRutaAnimada(Widget paginaSiguiente) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => paginaSiguiente,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Imagen y Encabezado de Fondo
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.42,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/login_header.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.45),
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                          ),
                          children: [
                            TextSpan(
                              text: 'VELOCE ',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: 'MOTORS',
                              style: TextStyle(color: primaryRed),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Tarjeta del Formulario de Inicio de Sesión
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111111),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Sign in to access your premium collection',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF757575),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Campo: Email Address
                    const Text(
                      'EMAIL ADDRESS',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4A4A4A),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'name@luxury.com',
                        hintStyle: const TextStyle(color: Color(0xFFB0B0B0), fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: primaryRed),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Campo: Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'PASSWORD',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4A4A4A),
                            letterSpacing: 0.5,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Forgot?',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: primaryRed,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      obscureText: true,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: '••••••••',
                        hintStyle: const TextStyle(color: Color(0xFFB0B0B0), fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: primaryRed),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Botón Login (Navegación al Catálogo)
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryRed,
                          elevation: 4,
                          shadowColor: primaryRed.withOpacity(0.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // Al integrar con la rama del Catálogo, descomentar:
                          // Navigator.push(context, _crearRutaAnimada(const CatalogoScreen()));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Separador "OR CONTINUE WITH"
                    Row(
                      children: const [
                        Expanded(child: Divider(color: Color(0xFFE0E0E0))),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            'OR CONTINUE WITH',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF9E9E9E),
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: Color(0xFFE0E0E0))),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Botones Social Media
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              side: const BorderSide(color: Color(0xFFE0E0E0)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              'assets/google_logo.png',
                              height: 20,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.g_mobiledata, size: 24, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              side: const BorderSide(color: Color(0xFFE0E0E0)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: const Icon(Icons.apple, color: Colors.black, size: 22),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // Registro / Sign Up
                    Center(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 13, color: Color(0xFF666666)),
                          children: [
                            TextSpan(text: "Don't have an account? "),
                            TextSpan(
                              text: 'Sign up',
                              style: TextStyle(
                                color: primaryRed,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}