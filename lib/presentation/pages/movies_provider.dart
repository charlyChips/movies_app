import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cache/genres_cache_source.dart';
import '../../cache/settings_cache_source.dart';
import '../../data/genres_data_repository.dart';
import '../../data/movies_data_repository.dart';
import '../../data/settings_data_repository.dart';
import '../../domain/usecases/movies_usecases.dart';
import '../../managers/date_manager_imp.dart';
import '../../remote/genre_remote_source.dart';
import '../../remote/movie_remote_source.dart';
import '../../remote/settings_remote_source.dart';
import '../cubit/movies_cubit.dart';
import 'movies_list_page.dart';

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
          dateManager: DateManagerImp(),
        ),
      ),
      child: MoviesListPage(),
    );
  }
}
