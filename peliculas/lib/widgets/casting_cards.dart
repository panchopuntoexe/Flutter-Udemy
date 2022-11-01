import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/movies_provider.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 150),
            height: 180,
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        final List<Cast> cast = snapshot.data!;

        return Container(
          margin: EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            itemBuilder: (_, int index) => _CastCard(actor: cast[index]),
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({super.key, required this.actor});
  final Cast actor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      //color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('${actor.fullProfilePath}'),
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            actor.name,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
