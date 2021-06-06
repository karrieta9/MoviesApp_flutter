import 'package:flutter/material.dart';
import 'package:movies_app_flutter/src/pages/inicio.dart';
import 'package:movies_app_flutter/src/pages/pelicula_detalle.dart';
import 'package:movies_app_flutter/src/pages/series_screen.dart';
import 'package:movies_app_flutter/src/pages/peliculas_screen.dart';
 
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
        'peliculas' : (BuildContext context) => PeliculasScreen(),
        'series' : (BuildContext context) => SeriesScreen(),
        'pelicula' : (BuildContext context) => PeliculaDetalle(),
      },
      theme: ThemeData(
        fontFamily: 'NanumGothic',
        primaryColor: Color(0xFFFBC914),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.normal,
            color: Colors.black
          ),
          headline2: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          bodyText2: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
            color: Colors.black
          )
        )
      ),
    );
  }
}