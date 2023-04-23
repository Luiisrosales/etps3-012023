import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parcial_3/colores/colores.dart';
import 'package:flutter_parcial_3/paginas/apellidos.dart';
import 'package:flutter_parcial_3/paginas/datos.dart';
import 'package:line_icons/line_icons.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _seleccionado = 0;
  void _BarraNavega(int index) {
    setState(() {
      _seleccionado = index;
    });
  }

  final List<Widget> _paginas = [Datos(), Apellidos()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.person_2)],
        title: Text("Parcial 3 reqres API"),
      ),
      backgroundColor: Color.fromARGB(255, 102, 178, 212),
      body: _paginas[_seleccionado],
      //Barra inferior con opciones de navegación
      bottomNavigationBar:
          //Propiedad para que los botones del navigationBar se autoAjusten
          BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _seleccionado,
              onTap: _BarraNavega,
              items: [
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Datos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_rounded), label: 'Apellidos'),
          ]),

      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
