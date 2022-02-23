import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fix_the_grid/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(FixmyGrid());
}

class FixmyGrid extends StatelessWidget {
  const FixmyGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: StartPage(),
      ),
    );
  }
}
