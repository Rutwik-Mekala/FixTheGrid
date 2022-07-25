import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Board.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: screensize.height * 0.5,
            padding: EdgeInsets.all(5),
            child: Hero(
              tag: 'dip',
              child: Text(
                'Fix The Grid',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  decoration: TextDecoration.none,
                  textStyle: TextStyle(
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                    fontSize: screensize.height * 0.10,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: Text(
              'CLICK TO START',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: screensize.height * 0.025,
                      fontWeight: FontWeight.bold)),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Board()));
            },
          )
        ],
      ),
    );
  }
}
