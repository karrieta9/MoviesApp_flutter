import 'package:flutter/material.dart';
import 'package:movies_app_flutter/src/providers/peliculas_prov.dart';
import 'package:movies_app_flutter/src/widgets/info_icon_text.dart';

class ActorDetalle extends StatelessWidget {
  final peliculasProv = new PeliculasProvider();


  @override
  Widget build(BuildContext context) {
    final actorId = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Scaffold(
        body: Container(
          child: FutureBuilder(
            future: peliculasProv.getActor(actorId),
            builder: (context, AsyncSnapshot snap){
              if(snap.hasData){
                return Contenido(snap.data);
              }else{
                return Center(child: CircularProgressIndicator());
              }
            }
          ),
        ),
      ),
    );
  }
}

class Contenido extends StatelessWidget {
  final actor;
  const Contenido(this.actor);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: <Widget>[
          Hero(
            // tag: pelicula.uniqueId,
            tag: 00,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(actor.getPhotoImg()),
                height: 250.0,
              ),
            ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  actor.name,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  actor.knownForDepartment,
                  style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 20.0),
                InfoIconText(
                  icon: Icons.date_range, 
                  texto: actor.birthday
                ),
                // InfoIconText(
                //   icon: Icons.date_range, 
                //   texto: pelicula.releaseDate,
                // ),
                // InfoIconText(
                //   icon: Icons.people, 
                //   texto: pelicula.popularity.toString(),
                // ),
              ],
            )
          )
        ],
      ),
    );
  }
}
