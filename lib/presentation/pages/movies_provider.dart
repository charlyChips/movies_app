import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cache/genres_cache_source.dart';
import 'package:movies_app/cache/settings_cache_source.dart';
import 'package:movies_app/data/genres_data_repository.dart';
import 'package:movies_app/data/movies_data_repository.dart';
import 'package:movies_app/data/settings_data_repository.dart';
import 'package:movies_app/domain/usecases/movies_usecases.dart';
import 'package:movies_app/presentation/cubit/movies_cubit.dart';
import 'package:movies_app/presentation/pages/movies_list_page.dart';
import 'package:movies_app/remote/genre_remote_source.dart';
import 'package:movies_app/remote/movie_remote_source.dart';
import 'package:movies_app/remote/settings_remote_source.dart';

class MoviesProvider extends StatelessWidget {
  const MoviesProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesCubit>(
      create: (_) => MoviesCubit(
        moviesUsecases: MoviesUsecasesImp(
          genresRepository: GenresDataRepository(
              cacheSource: GenresCacheSource(),
              remoteSource: GenreRemoteSource()),
          settingsRepo: SettingsDataRepository(
            cacheSource: SettingsCacheSource(),
            remoteSource: SettingsRemoteSource(),
          ),
          moviesRepo: MoviesDataRepository(MovieRemoteSource()),
        ),
      ),
      child: MoviesListPage(),
    );
  }
}
