import 'package:flutter/material.dart';

class NearlyActivityItem extends StatelessWidget {
  final String name;
  final String subText;
  final String when;

  NearlyActivityItem(this.name, this.subText, this.when);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 16),
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
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  subText,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            Text(when)
          ],
        ),
      ),
    );
  }
}