import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final IconData icon;
  ProfileButton({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 30, 41, 59),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon,color: Color.fromARGB(255, 125, 57, 236),),
              SizedBox(width: 8,),
              Text(text, style: TextStyle(color: Colors.grey[200]),)
            ],
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.grey[200]),
        ],
      ),
    );
    }

}