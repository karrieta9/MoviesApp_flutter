import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies_app_flutter/src/models/peliculas_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper({ @required this.peliculas });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.only(top:20.0),
        child: Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          itemBuilder: (BuildContext context, int i){
            peliculas[i].uniqueId = '${peliculas[i].id}-tarjeta';
            return Hero(
              tag: peliculas[i].uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'pelicula', arguments: peliculas[i]);
                  },
                  child: FadeInImage(
                    placeholder: AssetImage('assets/img/loading.gif'), 
                    image: NetworkImage(peliculas[i].getPosterImg()),
                    fit: BoxFit.cover,
                  ),
                )
              ),
            );
          },
          itemCount: peliculas.length,
          // pagination: new SwiperPagination(),
          // control: new SwiperControl(),
      ),
    );
  }
}