import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TitleName extends StatefulWidget {
  double screensize = 0;
  TitleName(this.screensize);

  @override
  State<TitleName> createState() => _TitleNameState();
}

class _TitleNameState extends State<TitleName>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _controller.forward();

    animation = ColorTween(
      begin: Colors.red,
      end: Colors.white,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: widget.screensize * 0.10,
      padding: EdgeInsets.all(15),
      child: Hero(
        tag: 'dip',
        child: Text(
          'Fix The Grid',
          style: GoogleFonts.lato(
            decoration: TextDecoration.none,
            textStyle: TextStyle(
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
              fontSize: widget.screensize * 0.050,
              color: animation.value,
            ),
          ),
        ),
      ),
    );
  }
}
