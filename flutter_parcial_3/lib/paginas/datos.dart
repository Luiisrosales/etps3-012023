import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_parcial_3/modelo/users.dart';
import 'package:http/http.dart' as http;

class Datos extends StatefulWidget {
  const Datos({super.key});

  @override
  State<Datos> createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  late Future<List<users>> _listadoUsers;

  Future<List<users>> _getUsers() async {
    final response = await http
        .get(Uri.parse("https://reqres.in/api/users?page=1&per_page=10"));

    List<users> gif = [];
    if (response.statusCode == 200) {
      String bodys = utf8.decode(response.bodyBytes);
      //print(bodys);

      final jsonData = jsonDecode(bodys);
      // print(jsonData["data"][0]["username"]);
      for (var item in jsonData["data"]) {
        gif.add(users(item["first_name"], item["avatar"]));
      }
      return gif;
    } else {
      throw Exception("Falla en conectarse");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoUsers = _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Parcial 3",
      home: Scaffold(
          body: FutureBuilder(
        future: _listadoUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data);
            return GridView.count(
              crossAxisCount: 2,
              children: _listadoUser(snapshot.requireData),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("Error");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }

  List<Widget> _listadoUser(List<users> data) {
    List<Widget> users = [];
    for (var gif in data) {
      users.add(Card(
          child: Column(
        children: [
          Expanded(
            child: Image.network(
              gif.url,
              fit: BoxFit.fill,
            ),
          ),
          /*    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(gif.nombre),
          ),*/
        ],
      )));
    }
    return users;
  }
}
