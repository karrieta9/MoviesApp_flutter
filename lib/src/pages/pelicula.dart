import 'package:flutter/material.dart';
import 'package:movies_app_flutter/src/models/actores_model.dart';
import 'package:movies_app_flutter/src/models/peliculas_model.dart';
import 'package:movies_app_flutter/src/providers/peliculas_prov.dart';

class PeliculaDetalle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _crearAppbar(pelicula),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10.0,),
                  _posterTitulo(context, pelicula),
                  _descripcion(pelicula),
                  _crearCast(pelicula.id)
                ]
              )
            )
          ],
        )
      ),
    );
  }

  Widget _crearAppbar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.redAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            pelicula.title, 
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white, 
              fontSize: 16.0,
            ),     
          ),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroundImg()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 500),
        ),
      )
    );
  }

  Widget _posterTitulo( BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterImg()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  pelicula.title,
                  style: Theme.of(context).textTheme.headline4, overflow: TextOverflow.ellipsis,
                ),
                Text(
                  pelicula.originalTitle,
                  style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(Icons.star_border),
                    Text(
                      pelicula.voteAverage.toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                )
              ],
            )
          )
        ],
      ),
    );
  }

  Widget _descripcion(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _crearCast(int id) {
    final peliculasProv = new PeliculasProvider();

    return FutureBuilder(
      future: peliculasProv.getActores(id.toString()),
      // initialData: InitialData,
      builder: (context, AsyncSnapshot<List> snapshot) {
        if(snapshot.hasData){
          return _crearListaActores(snapshot.data);
        }else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearListaActores(List<Actor> actores) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1
        ),
        itemCount: actores.length,
        itemBuilder: (context, i){
          return Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/img/no-image.jpg'), 
                    image: NetworkImage(actores[i].getPhotoImg()),
                    height: 150.0,
                    fit : BoxFit.cover
                  ),
                ),
                SizedBox(height: 5.0,),
                Text(
                  actores[i].name,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        },
      )
    );
  }
}