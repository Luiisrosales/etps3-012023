import 'package:flutter/material.dart';
import 'package:flutter_parcial_3/paginas/principal.dart';

void main() {
  runApp(FlutterMain());
}

class FlutterMain extends StatelessWidget {
  const FlutterMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}
