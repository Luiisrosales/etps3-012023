import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parcial_3/colores/colores.dart';
import 'package:flutter_parcial_3/json/datos_json.dart';
import 'package:line_icons/line_icons.dart';

class Apellidos extends StatelessWidget {
  const Apellidos({super.key});

  @override
  Widget build(BuildContext context) {
    var tamanio = MediaQuery.of(context).size;

    return Column(
      children: List.generate(data.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 50, right: 10, top: 25),
          child: FadeInDown(
            duration: Duration(milliseconds: 100 * index),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Row(children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                data[index]['carnet'],
                                style: TextStyle(
                                    fontSize: 25,
                                    color: white,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    data[index]['estudiante'],
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: white.withOpacity(0.5),
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Divider(
                    color: white.withOpacity(0.3),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
