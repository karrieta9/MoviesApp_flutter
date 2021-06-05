import 'package:flutter/material.dart';
import 'package:movies_app_flutter/src/models/peliculas_model.dart';

class ContentHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  ContentHorizontal({ @required this.peliculas, @required this.siguientePagina });

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        this.siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.19,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        // children: _cartas(context),
        itemCount: peliculas.length,
        itemBuilder: (context, i) {
          return _crearUnaCarta(context, peliculas[i]);
        },
      )
    );
  }

  Widget _crearUnaCarta(BuildContext cont, Pelicula pelicula) {
    pelicula.uniqueId = '${pelicula.id}-populares';
    return GestureDetector(
      onTap: () {
        print('i ${pelicula.id} ');
        Navigator.pushNamed(cont, 'pelicula', arguments: pelicula);
      },
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: pelicula.uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/loading.gif'),
                  fit: BoxFit.cover,
                  height: 130.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(cont).textTheme.caption,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _cartas(BuildContext cont) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/loading.gif'),
                fit: BoxFit.cover,
                height: 130.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(cont).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}