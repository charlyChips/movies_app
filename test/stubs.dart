import 'package:movies_app/data/models/genres_dto.dart';
import 'package:movies_app/data/models/movies_dto.dart';
import 'package:movies_app/data/models/settings_dto.dart';
import 'package:movies_app/domain/models/genre.dart';
import 'package:movies_app/domain/models/movie.dart';
import 'package:movies_app/domain/models/movies_result.dart';
import 'package:movies_app/domain/models/settings.dart';

abstract class Stubs {
  static const String releaseDate = '01-01-2021';
  static const String releaseDateFormatted = '01 de Enero del 2021';

  static List<MovieDto> moviesDto = <MovieDto>[
    MovieDto(
        genreIds: [1, 2],
        title: 'title',
        releaseDate: '20-12-2020',
        posterPath: '/poster1',
        backdropPath: '/back1'),
    MovieDto(
        genreIds: [2, 3],
        title: 'title',
        releaseDate: '20-12-2020',
        posterPath: '/poster2',
        backdropPath: '/back2'),
    MovieDto(
        genreIds: [1, 3],
        title: 'title',
        releaseDate: '20-12-2020',
        posterPath: '/poster3',
        backdropPath: '/back3'),
  ];

  static List<GenreDto> genresDto = <GenreDto>[
    GenreDto(id: 1, name: 'Uno'),
    GenreDto(id: 2, name: 'Dos'),
    GenreDto(id: 3, name: 'Tres')
  ];

  static List<Genre> genres = <Genre>[
    Genre(id: 1, name: 'Uno'),
    Genre(id: 2, name: 'Dos'),
    Genre(id: 3, name: 'Tres')
  ];

  static SettingsDto settingsDto = SettingsDto(
      images: SettingsImagesDto(
        backdropSizes: ['b1', 'b2', 'b3', 'b4'],
        baseUrl: 'baseUrl/',
        secureBaseUrl: 'secureBaseUrl/',
        posterSizes: ['p1', 'p2', 'p3', 'p4'],
      ),
      changeKeys: ['a', 'b', 'c']);

  static Settings settings = Settings(
      images: SettingsImages(
          backdropSizes: ['b1', 'b2', 'b3', 'b4'],
          baseUrl: 'baseUrl/',
          secureBaseUrl: 'secureBaseUrl/',
          posterSizes: ['p1', 'p2', 'p3', 'p4'],
          logoSizes: ['l1', 'l2', 'l3'],
          profileSizes: ['ps1', 'ps2', 'ps3', 'ps4'],
          stillSizes: ['s1', 's2', 's3', 's4']),
      changeKeys: ['a', 'b', 'c']);

  static List<Movie> movies = <Movie>[
    Movie(
        adult: false,
        backdropPath: 'backdropPath1',
        genres: <Genre>[
          Genre(id: 1, name: 'Genre1'),
          Genre(id: 11, name: 'Genre11'),
        ],
        id: 1,
        mediaType: 'mediaType',
        originalLanguage: 'originalLanguage',
        originalTitle: 'originalTitle1',
        overview: 'overview1',
        popularity: 100,
        posterPath: 'posterPath1',
        releaseDate: '01 de Enero del 2021',
        title: 'title1',
        video: false,
        voteAverage: 1,
        voteCount: 100),
    Movie(
        adult: false,
        backdropPath: 'backdropPath2',
        genres: <Genre>[
          Genre(id: 2, name: 'Genre2'),
          Genre(id: 22, name: 'Genre22'),
        ],
        id: 2,
        mediaType: 'mediaType',
        originalLanguage: 'originalLanguage',
        originalTitle: 'originalTitle2',
        overview: 'overview2',
        popularity: 200,
        posterPath: 'posterPath2',
        releaseDate: '02 de Enero del 2021',
        title: 'title2',
        video: false,
        voteAverage: 2,
        voteCount: 200),
    Movie(
        adult: false,
        backdropPath: 'backdropPath3',
        genres: <Genre>[
          Genre(id: 3, name: 'Genre3'),
          Genre(id: 33, name: 'Genre33'),
        ],
        id: 3,
        mediaType: 'mediaType',
        originalLanguage: 'originalLanguage',
        originalTitle: 'originalTitle3',
        overview: 'overview3',
        popularity: 300,
        posterPath: 'posterPath3',
        releaseDate: '03 de Enero del 2021',
        title: 'title3',
        video: false,
        voteAverage: 3,
        voteCount: 300),
  ];

  static List<MovieResultItem> moviesItems = <MovieResultItem>[
    MovieResultItem(
        adult: false,
        backdropPath: 'backdropPath1',
        genreIds: <int>[1, 2],
        id: 1,
        mediaType: 'mediaType',
        originalLanguage: 'originalLanguage',
        originalTitle: 'originalTitle1',
        overview: 'overview1',
        popularity: 100,
        posterPath: 'posterPath1',
        releaseDate: releaseDate,
        title: 'title1',
        video: false,
        voteAverage: 1,
        voteCount: 100),
    MovieResultItem(
        adult: false,
        backdropPath: 'backdropPath2',
        genreIds: <int>[2, 3],
        id: 2,
        mediaType: 'mediaType',
        originalLanguage: 'originalLanguage',
        originalTitle: 'originalTitle2',
        overview: 'overview2',
        popularity: 200,
        posterPath: 'posterPath2',
        releaseDate: releaseDate,
        title: 'title2',
        video: false,
        voteAverage: 2,
        voteCount: 200),
    MovieResultItem(
        adult: false,
        backdropPath: 'backdropPath3',
        genreIds: <int>[1, 3],
        id: 3,
        mediaType: 'mediaType',
        originalLanguage: 'originalLanguage',
        originalTitle: 'originalTitle3',
        overview: 'overview3',
        popularity: 300,
        posterPath: 'posterPath3',
        releaseDate: releaseDate,
        title: 'title3',
        video: false,
        voteAverage: 3,
        voteCount: 300),
  ];
}
