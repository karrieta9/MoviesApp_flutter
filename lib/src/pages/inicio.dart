import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  final List<Map> _categorias = [
    {
      'nombre': 'Peliculas',
      'icono' : Icons.movie,
      'ruta' : 'peliculas'
    },
    {
      'nombre': 'Series',
      'icono' : Icons.live_tv,
      'ruta' : 'series'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    top: -65,
                    left: -110,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(244, 244, 245, 0.8),
                        borderRadius: BorderRadius.circular(300)
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      CustomAppBar(),
                      Titulos(),
                      Buscar(),
                    ],
                  )
                ],
              ),
              Categorias(_categorias)
            ],
          )
          ),
      );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [     
          IconButton(
            splashRadius: 30.0,
            icon: Icon(Icons.menu),
            onPressed: () {}
          ),
          CircleAvatar(
            backgroundImage: NetworkImage('https://us.123rf.com/450wm/thesomeday123/thesomeday1231709/thesomeday123170900021/85622928-icono-de-perfil-de-avatar-predeterminado-marcador-de-posici%C3%B3n-de-foto-gris-vectores-de-ilustraciones.jpg?ver=6'),
            radius: 20.0,
          ),
        ],
      ),
    );
  }
}

class Titulos extends StatelessWidget {
  const Titulos({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Entretenimiento',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            'MoviesApp',
            style: Theme.of(context).textTheme.headline2,
          )
        ],
      ),
    );
  }
}

class Buscar extends StatelessWidget {
  const Buscar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0, bottom: 15.0),
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Buscar',
          labelText: 'Buscar',
          suffixIcon: Icon(Icons.search),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0)
          )
        ),
      onChanged: (valor) {}
      ),
    );
  }
}


class Categorias extends StatelessWidget {
  final List listaCategorias;
  const Categorias(this.listaCategorias);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Categorias',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Container(
            height: 180.0,
            child: PageView(
              pageSnapping: false,
              controller: PageController(
                initialPage: 0,
                viewportFraction: 0.5
              ),
              children: _cartas(context)
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _cartas(BuildContext cont) {
    return listaCategorias.map((cat) {
      return GestureDetector(
        onTap: () {
          print(cat['ruta']);
          Navigator.pushNamed(cont, cat['ruta']);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3)
              )
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                cat['icono'],
                color: Theme.of(cont).primaryColor,
                size: 90.0,
              ),
              Text(
                cat['nombre'],
                overflow: TextOverflow.ellipsis,
                style: Theme.of(cont).textTheme.bodyText2,
              )
            ],
          ),
        ),
      );
    }).toList();
  }
}