import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/domain/models/genre.dart';
import 'package:movies_app/domain/models/movie.dart';

import 'genre_label.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: PhysicalModel(
          color: Colors.white,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(10.0),
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: movie.backdropPath,
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    fit: BoxFit.cover,
                    placeholder: (context, string) => Icon(Icons.image),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(height: 8),
                        Text('Fecha de lanzamiento: ${movie.releaseDate}'),
                        SizedBox(height: 8),
                        Wrap(
                            children: movie.genres
                                .map<Widget>((Genre genre) =>
                                    GenreLabel(genreName: genre.name))
                                .toList()),
                      ],
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.blue),
                      onPressed: () {})
                ],
              )),
        ));
  }
}
