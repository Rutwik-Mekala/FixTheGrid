import 'package:flutter/material.dart';

class GridButton extends StatefulWidget {
  final Function click;
  final String text;

  GridButton(this.text, this.click);

  @override
  State<GridButton> createState() => _GridButtonState();
}

class _GridButtonState extends State<GridButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0),
        ),
        backgroundColor: animation.value,
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        widget.click();
      },
    );
  }
}
