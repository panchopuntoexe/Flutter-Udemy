import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({
    Key? key,
    required this.imageUrl,
    this.name,
  }) : super(key: key);

  final String imageUrl;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      shadowColor: AppTheme.primaryColor.withOpacity(0.6),
      child: Column(children: [
        FadeInImage(
          image: NetworkImage(imageUrl),
          placeholder: const AssetImage('assets/jar-loading.gif'),
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 200),
        ),
        if (name != null)
          Container(
            padding: const EdgeInsets.all(10),
            alignment: AlignmentDirectional.centerEnd,
            child: Text(name ?? 'Sin nombre'),
          )
      ]),
    );
  }
}
