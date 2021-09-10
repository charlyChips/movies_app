import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:movies_app/domain/models/genre.dart';
import 'package:movies_app/presentation/widgets/genre_label.dart';
import '../../domain/models/movie.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalle de película'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: PhysicalModel(
                color: Colors.white,
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10.0),
                shadowColor: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Hero(
                              tag: movie.id,
                              child: CachedNetworkImage(
                                imageUrl: movie.posterPath,
                                width: size.width * 0.3,
                                fit: BoxFit.cover,
                                placeholder: (context, string) =>
                                    Icon(Icons.image),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(movie.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 0.95,
                                        fontSize: 32)),
                                const SizedBox(height: 4),
                                Text('(${movie.originalTitle})',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        height: 0.95,
                                        fontSize: 14)),
                                const SizedBox(height: 12),
                                Text('Lanzamiento: ${movie.releaseDate}',
                                    style: TextStyle(fontSize: 16)),
                                const SizedBox(height: 12),
                                Wrap(
                                    children: movie.genres
                                        .map<Widget>((Genre genre) =>
                                            GenreLabel(genreName: genre.name))
                                        .toList())
                              ],
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          movie.overview,
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Text('Calificación',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text('Número de votantes: ${movie.voteCount}',
                                    style: TextStyle(fontSize: 18)),
                              ],
                            )),
                            CircularPercentIndicator(
                              radius: 60.0,
                              lineWidth: 5.0,
                              percent: movie.voteAverage / 10.0,
                              center: new Text(
                                movie.voteAverage.toStringAsFixed(2),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              progressColor: Colors.blue,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
