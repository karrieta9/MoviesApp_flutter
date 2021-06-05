import 'package:flutter/material.dart';
import 'package:movies_app_flutter/src/search/search_delegate.dart';
import 'package:movies_app_flutter/src/widgets/card_swiper.dart';
import 'package:movies_app_flutter/src/providers/peliculas_prov.dart';
import 'package:movies_app_flutter/src/widgets/content_horizontal_scroll.dart';

class Inicio extends StatelessWidget {
  
  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cine'),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: () {
              showSearch(
                context: context, 
                delegate: DataSearch(),
                // query: 'Hola'
              );
            }
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _movieScroll(context)
          ],
        )
      ),
    );
  }

   Widget _swiperTarjetas() {

     return FutureBuilder(
       future: peliculasProvider.getEnCines(),
      //  initialData: [],
       builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
         if(snapshot.hasData){
          return CardSwiper(peliculas: snapshot.data);
         }else {
           return Container(
             height: 400.0,
             child: Center(
               child: CircularProgressIndicator()
              )
            );
         }
         
       },
     );
   }

  Widget _movieScroll(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populares', style: Theme.of(context).textTheme.subtitle1,)
          ),
          SizedBox(height: 5.0,),
          // FutureBuilder(
          //   future: peliculasProvider.getPopulares(),
          //   builder: (context, AsyncSnapshot snapshot){
          //     if(snapshot.hasData){
          //       return ContentHorizontal(peliculas: snapshot.data,);
          //     }else{
          //       return Center(child: CircularProgressIndicator());
          //     }
          //   }
          // )
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: (context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return ContentHorizontal(
                  peliculas: snapshot.data,
                  siguientePagina: peliculasProvider.getPopulares,
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            }
          )
        ],
      ),
      width: double.infinity,
    );
  }
}