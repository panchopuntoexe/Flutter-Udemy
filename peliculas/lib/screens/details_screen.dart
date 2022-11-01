import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(
            movie: movie,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndTitle(movie: movie),
            _Overview(movie.overview),
            CastingCards(movieId: movie.id),
          ]))
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final String overview;

  _Overview(this.overview);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  _PosterAndTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 170),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    movie.originalTitle,
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star_outline, size: 15, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        '${movie.voteAverage}',
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
          color: Colors.black12,
          child: Text(
            movie.title,
            style: TextStyle(fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
