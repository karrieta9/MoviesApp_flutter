import 'package:flutter/material.dart';
import 'package:movies_app_flutter/src/models/peliculas_model.dart';
import 'package:movies_app_flutter/src/providers/peliculas_prov.dart';

class DataSearch extends SearchDelegate{

  final peliculasProv = new PeliculasProvider();

  final peliculas = [
    'spiderman',
    'cap america',
    'iron man',
    'aquaman',
    'batman',
    'hombre de acero'
  ];
  final recientes = [
    'spiderman',
    'cap america'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones del AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: () {
          query = '';
        }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow, 
        progress: transitionAnimation
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea resultados a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProv.buscarPelicula(query),
      // initialData: InitialData,
      builder: ( context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if(snapshot.hasData){
          return ListView(
            children: snapshot.data.map((pelicula){
            return ListTile(
              leading: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'), 
                image: NetworkImage(pelicula.getPosterImg()),
                width: 50.0,
                fit: BoxFit.contain,
              ),
              title: Text(pelicula.title),
              subtitle: Text(pelicula.originalTitle),
              onTap: (){
                  close(context, null);
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'pelicula', arguments: pelicula); 
              }
            );
            }).toList(),
          );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }  
  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // Sugerencias que aparecen mientras se escribe

  //   final sugerencias = (query.isEmpty) ? recientes : peliculas
  //   .where((p) => p.toLowerCase()
  //   .startsWith(query.toLowerCase()))
  //   .toList();

  //   return ListView.builder(
  //     itemCount: sugerencias.length,
  //     itemBuilder: (context, i ){
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(sugerencias[i]),
  //         onTap: () {},
  //       );
  //     },
  //   );
  // }

}