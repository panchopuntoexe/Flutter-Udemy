import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tarjetas Widget'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: const [
            CustomCardType1(),
            SizedBox(height: 10),
            CustomCardType2(
              name: 'Un hermoso paisaje',imageUrl:
                  'https://www.ecestaticos.com/imagestatic/clipping/8d9/002/8d9002f7534ffcc1ff8fe6ed6d9cfd65/arquitectura-brutalista.jpg',
            ),
            SizedBox(height: 10),
            CustomCardType2(
                imageUrl:
                    'https://aesval.es/wp-content/uploads/2022/06/arquitectura-brutalista.jpg'),
            SizedBox(height: 10),
            CustomCardType2(
                imageUrl:
                    'https://imagenes.elpais.com/resizer/pgZGkIb11xCWd9fgmuHxk9LhcMI=/1960x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/TQXZVHYJOFHTZMBUOPD4MRO3QQ.JPG')
          ],
        ));
  }
}
