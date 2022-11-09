import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PagoCompletoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.star,
            color: Colors.white,
            size: 100,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '¡Gracias por tu compra!',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ],
      )),
    );
  }
}
