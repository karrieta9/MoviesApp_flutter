import 'package:flutter/material.dart';

class AppBarGeneral extends StatelessWidget {

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
          IconButton(
            splashRadius: 30.0,
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: () {
              // showSearch(
              //   context: context, 
                // delegate: DataSearch(),
                // query: 'Hola'
              // );
            }
          )
        ],
      ),
    );
  }
}