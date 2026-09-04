import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}


// CONFIGURACIÓN PRINCIPAL

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Detalles de la Nave Planet Express',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Lexend',
        scaffoldBackgroundColor: AppColors.blanco,
      ),
      home: const DetalleVehiculoScreen(),
    );
  }
}


// CONSTANTES DE COLOR Y ESTILOS

class AppColors {
  static const Color rojoPrincipal = Color(0xFFEC1313);
  static const Color blanco = Colors.white;
  static const Color negro = Colors.black;
  static const Color textoGrisClaro = Color(0xFF9E9E9E);
  static const Color textoGrisOscuro = Color(0xFF616161);
  static const Color fondoTarjetas = Color(0xFFFAFAFA);
  static const Color bordeTarjetas = Color(0xFFF0F0F0);
}

class AppTextStyles {
  static const TextStyle tituloSeccion = TextStyle(
    fontFamily: 'Lexend',
    fontSize: 14,
    fontWeight: FontWeight.w900,
    letterSpacing: 0.8,
    color: AppColors.negro,
  );
}


// PANTALLA PRINCIPAL

class DetalleVehiculoScreen extends StatelessWidget {
  const DetalleVehiculoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blanco,
      body: SafeArea(
        child: Column(
          children: [
            const _BarraSuperior(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _GaleriaImagen(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          _InformacionTituloYPrecio(),
                          SizedBox(height: 20),
                          _GridEspecificaciones(),
                          SizedBox(height: 28),
                          _SeccionDescripcion(),
                          SizedBox(height: 28),
                          _SeccionCaracteristicas(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const _BarraAccionesInferior(),
          ],
        ),
      ),
    );
  }
}


// COMPONENTES DE LA INTERFAZ


class _BarraSuperior extends StatelessWidget {
  const _BarraSuperior();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.negro),
            onPressed: () {},
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.share_outlined, size: 20, color: AppColors.negro),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border, size: 20, color: AppColors.negro),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GaleriaImagen extends StatelessWidget {
  const _GaleriaImagen();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 220,
          color: AppColors.blanco,
          child: Image.asset(
            'assets/img/Carro5.jpeg',
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(Icons.rocket_launch, size: 90, color: AppColors.textoGrisClaro),
              );
            },
          ),
        ),
        Positioned(
          bottom: 12,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.negro.withOpacity(0.55),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '1 / 3',
              style: TextStyle(
                fontFamily: 'Lexend',
                color: AppColors.blanco,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InformacionTituloYPrecio extends StatelessWidget {
  const _InformacionTituloYPrecio();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'NAVE PLANET\nEXPRESS v3000',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                  color: AppColors.negro,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Verde Moco Eléctrico • Núcleo Materia Oscura',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 12,
                  color: AppColors.textoGrisOscuro,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              '\$ 850.000,000 USD',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 19,
                fontWeight: FontWeight.w900,
                color: AppColors.rojoPrincipal,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Excl. impuestos de la NASA/IAU',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 9,
                color: AppColors.textoGrisClaro,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _GridEspecificaciones extends StatelessWidget {
  const _GridEspecificaciones();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 2.1,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: const [
        SpecCard(title: 'VELOCIDAD CRUCERO', value: '599,584', unit: 'KM/S'),
        SpecCard(title: 'IMPULSO ESPECÍFICO', value: '999,000', unit: 'SEC ISP'),
        SpecCard(title: 'CAPACIDAD CARGA', value: '50,000', unit: 'Tn'),
        SpecCard(title: 'RESISTENCIA CASCO', value: '10,000', unit: 'ATM'),
      ],
    );
  }
}

class _SeccionDescripcion extends StatelessWidget {
  const _SeccionDescripcion();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'ESPECIFICACIONES AEROESPACIALES',
          style: AppTextStyles.tituloSeccion,
        ),
        SizedBox(height: 10),
        Text(
          'Diseñada por el Profesor Hubert J. Farnsworth, la nave de Planet Express es un vehículo espacial de '
          'clase logística avanzada. Su sistema de propulsión no reactivo desplaza la estructura del espacio-tiempo '
          'a su alrededor en lugar de acelerar la masa de la nave, permitiendo alcanzar velocidades orbitales '
          'y supralumínicas de hasta 599,584 km/s (2c). Su fuselaje monocasco está construido en titanio reforzado '
          'capaz de soportar presiones ambientales de hasta 10,000 atmósferas en inmersión planetaria o aproximación '
          'al horizonte de sucesos.',
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 12,
            height: 1.5,
            color: AppColors.textoGrisOscuro,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _SeccionCaracteristicas extends StatelessWidget {
  const _SeccionCaracteristicas();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'TECNOLOGÍA DE BORDO',
          style: AppTextStyles.tituloSeccion,
        ),
        SizedBox(height: 12),
        FeatureItem(text: 'Propulsor de Desplazamiento Métrico Espacial'),
        FeatureItem(text: 'Módulo de Navegación A.I. de Clase Sentiente'),
        FeatureItem(text: 'Sistema Deflector de Defensas por Láser de Pulsos'),
        FeatureItem(text: 'Bodega de Carga Presurizada con Soporte Criogénico'),
        FeatureItem(text: 'Escudo Térmico para Reentrada Atmosférica de Clase V'),
      ],
    );
  }
}

class _BarraAccionesInferior extends StatelessWidget {
  const _BarraAccionesInferior();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.blanco,
        border: Border(top: BorderSide(color: AppColors.bordeTarjetas, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: AppColors.negro, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'CONTACTAR PROFESOR',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  color: AppColors.negro,
                  fontWeight: FontWeight.w800,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.rojoPrincipal,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'SOLICITAR COTIZACIÓN',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  color: AppColors.blanco,
                  fontWeight: FontWeight.w800,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// WIDGETS REUTILIZABLES
// ==========================================

class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: AppColors.rojoPrincipal,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: AppColors.blanco,
              size: 12,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Lexend',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textoGrisOscuro,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpecCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;

  const SpecCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.fondoTarjetas,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.bordeTarjetas),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Lexend',
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: AppColors.textoGrisClaro,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: AppColors.negro,
                ),
              ),
              const SizedBox(width: 3),
              Text(
                unit,
                style: const TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textoGrisOscuro,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}