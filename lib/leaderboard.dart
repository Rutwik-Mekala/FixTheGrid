import 'dart:html';

import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            'LEADERBOARD',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        Container(
          child: ListView(
            children: [
              Row(
                children: [
                  Text('1) Rutwik'),
                  SizedBox(
                    width: 20,
                  ),
                  Text('135 seconds')
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
