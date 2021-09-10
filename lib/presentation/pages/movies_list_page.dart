import 'package:flutter/material.dart';
import '../widgets/genre_label.dart';

class MoviesListPage extends StatelessWidget {
  const MoviesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
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
                      FlutterLogo(
                        size: size.width * 0.2,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Los Vengadores',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(height: 8),
                            Text('Fecha de lanzamiento: 25 Oct 2021'),
                            SizedBox(height: 8),
                            Wrap(
                              children: [
                                GenreLabel(genreName: 'Acción'),
                                GenreLabel(genreName: 'Aventura'),
                                GenreLabel(genreName: 'Terror'),
                                GenreLabel(genreName: 'Acción'),
                                GenreLabel(genreName: 'Aventura'),
                                GenreLabel(genreName: 'Terror'),
                                GenreLabel(genreName: 'Acción'),
                                GenreLabel(genreName: 'Aventura'),
                                GenreLabel(genreName: 'Terror'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          icon:
                              Icon(Icons.arrow_forward_ios, color: Colors.blue),
                          onPressed: () {})
                    ],
                  )),
            ));
      }),
    );
  }
}
