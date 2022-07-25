import 'Board.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterName extends StatelessWidget {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'ENTER PLAYER NAME',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: 'Enter your name',
              labelStyle: GoogleFonts.lato(
                fontSize: 20,
              ),
            ),
            onChanged: (value) {
              name = value;
            },
          ),
          TextButton(
            child: Text('Play'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Board()));
            },
          ),
        ],
      ),
    );
  }
}
