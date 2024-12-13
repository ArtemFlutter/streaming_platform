import 'package:flutter/material.dart';

class MusicItem extends StatelessWidget {
  final String song;
  final String artist;

  MusicItem(this.song, this.artist);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 30, 41, 59),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 73, 56, 98),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Center(
                child: Icon(Icons.music_note, color: Color.fromARGB(255, 143, 82, 167),)
              )
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  artist,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 123, 58, 235),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Icon(Icons.play_arrow_outlined)),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}