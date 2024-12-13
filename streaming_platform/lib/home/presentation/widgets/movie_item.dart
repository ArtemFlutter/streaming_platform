import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final String title;
  MovieItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 120,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 30, 41, 59),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(Icons.local_movies_outlined,
                  color: Color.fromARGB(255, 125, 57, 236), size: 40),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
