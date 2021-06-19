import 'package:flutter/material.dart';
import 'package:previsao_do_tempo/screeans/home/widgets/main_screen.dart';
import 'package:previsao_do_tempo/screeans/home/widgets/weatcher_server.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          default:
            return MainScreen(snapshot.data["results"]);
        }
      },
    );
  }
}
