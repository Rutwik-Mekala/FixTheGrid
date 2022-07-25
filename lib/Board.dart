import 'dart:async';

import 'package:fix_the_grid/GridButton.dart';
import 'package:fix_the_grid/Title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;
  int timerSeconds = 0;

  var timer;
  static const duration = const Duration(seconds: 1);
  bool timerActive = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numbers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        startTime();
      });
    }
    return SafeArea(
      child: Container(
        color: Colors.blue,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleName(size.height),
            Container(
              height: size.height * 0.6,
              width: size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: numbers.length,
                  itemBuilder: (context, index) {
                    return numbers[index] != 0
                        ? GridButton("${numbers[index]}", () {
                            clickGrid(index);
                          })
                        : SizedBox.shrink();
                  },
                ),
              ),
            ),
            Container(
              height: size.height * 0.20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      reset();
                    },
                    child: Text(
                      'Reset',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text("Move: $move",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 18),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text("Time: $timerSeconds",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void startTime() {
    if (timerActive) {
      setState(() {
        timerSeconds = timerSeconds + 1;
      });
    }
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      timerSeconds = 0;
      timerActive = false;
    });
  }

  void clickGrid(index) {
    if (timerSeconds == 0) {
      timerActive = true;
    }
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      setState(() {
        move++;
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
      });
    }
    checkWin();
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void checkWin() {
    if (isSorted(numbers)) {
      timerActive = false;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            final size = MediaQuery.of(context).size;
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: size.height * 0.5,
                width: size.height * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("You Win!!!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(
                        width: 220.0,
                        child: MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Close",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }
}
