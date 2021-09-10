import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/movie.dart';
import '../cubit/movies_cubit.dart';
import '../widgets/movie_card.dart';

class MoviesListPage extends StatelessWidget {
  const MoviesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas'),
      ),
      body: BlocBuilder<MoviesCubit, MovieState>(
        builder: (BuildContext context, MovieState state) {
          if (state.movies.isNotEmpty) {
            return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  final Movie movie = state.movies[index];
                  return MovieCard(movie: movie);
                });
          }
          return Center(
            child: Text('No data'),
          );
        },
      ),
    );
  }
}
