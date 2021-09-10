import 'package:flutter/material.dart';

class GenreLabel extends StatelessWidget {
  const GenreLabel({Key? key, required this.genreName}) : super(key: key);

  final String genreName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.blue,
        ),
        child: Text(
          genreName,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
