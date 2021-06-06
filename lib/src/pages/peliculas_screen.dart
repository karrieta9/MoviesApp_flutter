import 'package:flutter/material.dart';
import 'package:movies_app_flutter/src/search/search_delegate.dart';
import 'package:movies_app_flutter/src/widgets/card_swiper.dart';
import 'package:movies_app_flutter/src/providers/peliculas_prov.dart';
import 'package:movies_app_flutter/src/widgets/content_horizontal_scroll.dart';
// import 'package:movies_app_flutter/src/widgets/app_bar_general.dart';

class PeliculasScreen extends StatelessWidget {
  
  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();

    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: _AppBarPrincipal()),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _swiperTarjetas(),
                // Expanded(child: Container(color: Colors.yellow,)),
                SizedBox(height: 100,),
                _movieScroll(context)
              ],
            )
          ),
        ],
      )
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
            child: Text(
              'Populares', 
              style: Theme.of(context).textTheme.bodyText1,
            )
          ),
          SizedBox(height: 10.0,),
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


class _AppBarPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            // splashColor: Colors.green,
            splashRadius: 30.0,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          Row(
            children : [
              IconButton(
                splashRadius: 30.0,
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              ),
              IconButton(
                splashRadius: 30.0,
                icon: Icon(Icons.search), 
                onPressed: () {
                  showSearch(
                    context: context, 
                    delegate: DataSearch(),
                    // query: 'Hola'
                  );
                }
              )
            ]
          )
        ],
      ),
    );
  }
}