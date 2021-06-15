import 'package:flutter/material.dart';

class InfoIconText extends StatelessWidget {
  final IconData icon;
  final String texto;
  const InfoIconText({ @required this.icon, @required this.texto});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(
          icon, 
          color: Theme.of(context).primaryColor
        ),
        SizedBox(width: 8.0),
        Text(
          texto,
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }
}