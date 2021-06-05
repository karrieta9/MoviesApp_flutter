import 'package:flutter/material.dart';
import 'package:movies_app_flutter/src/pages/inicio.dart';
import 'package:movies_app_flutter/src/pages/pelicula.dart';
// import 'package:movies_app_flutter/src/pages/pelicula.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tus Peliculas',
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context) => Inicio(),
        'pelicula' : (BuildContext context) => PeliculaDetalle(),
      },
    );
  }
}