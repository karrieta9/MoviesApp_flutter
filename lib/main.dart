import 'package:flutter/material.dart';
import 'package:movies_app_flutter/src/pages/inicio.dart';
import 'package:movies_app_flutter/src/pages/pelicula_detalle.dart';
import 'package:movies_app_flutter/src/pages/series_screen.dart';
import 'package:movies_app_flutter/src/pages/peliculas_screen.dart';
import 'package:movies_app_flutter/src/pages/actor_detalle.dart';
 
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
        'actor' : (BuildContext context) => ActorDetalle(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF070515),
        fontFamily: 'NanumGothic',
        // primaryColor: Color(0xFFFBC914),
        primaryColor: Color(0xFFD93025),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.normal,
            color: Color(0xFFF2F2F2)
          ),
          headline2: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFFF2F2F2)
          ),
          bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFFF2F2F2)
          ),
          bodyText2: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
            color: Color(0xFFF2F2F2)
          ),
          subtitle1: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.normal,
            color: Color(0xFFF2F2F2)
          ),
          subtitle2: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
//             color: Color(0xFFF2F2F2)
           color: Colors.red
          ),


          headline3: TextStyle(
            fontSize: 12.0,
            color: Color(0xFFF2F2F2)
          ),

          headline4: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFFF2F2F2)
            // color: Colors.amber
          ),
          headline5 : TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
            color: Color(0xFFF2F2F2).withOpacity(0.5)
          ),
        )
      ),
    );
  }
}
