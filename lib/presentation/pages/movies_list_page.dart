import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/pages/movie_detail_page.dart';

import '../../domain/models/movie.dart';
import '../cubit/movies_cubit.dart';
import '../widgets/movie_card.dart';

class MoviesListPage extends StatelessWidget {
  const MoviesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MoviesCubit cubit = context.read<MoviesCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas'),
      ),
      body: BlocBuilder<MoviesCubit, MovieState>(
        builder: (BuildContext context, MovieState state) {
          if (state.movies.isNotEmpty) {
            int itemCount = state.movies.length;
            if (state.isLoading) itemCount++;
            return RefreshIndicator(
              onRefresh: () async {
                cubit.refresh();
              },
              child: ListView.builder(
                  itemCount: itemCount,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == state.movies.length - 2)
                      cubit.getMoviesNextPage();

                    if (index < state.movies.length) {
                      final Movie movie = state.movies[index];
                      return MovieCard(
                          movie: movie, onTap: () => _navigate(context, movie));
                    } else {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 60),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  }),
            );
          } else if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Text('No data'),
          );
        },
      ),
    );
  }

  void _navigate(BuildContext context, Movie movie) {
    Navigator.of(context)
        .push<void>(MaterialPageRoute<void>(builder: (BuildContext context) {
      return MovieDetailPage(movie: movie);
    }));
  }
}
