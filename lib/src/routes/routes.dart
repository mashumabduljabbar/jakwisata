import 'package:flutter/material.dart';
import '../index.dart';

class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/preload': (context) => const PreloadPage(),
        '/beranda': (context) => const BerandaPage(),
        '/objekwisata': (context) => const ObjekwisataPage(),
        '/tempat': (context) => const TempatPage(),
        '/lokasi': (context) => const LokasiPage()
      },
      initialRoute: '/preload',
    );
  }
}
