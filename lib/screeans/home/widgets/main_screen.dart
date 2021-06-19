import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:previsao_do_tempo/models/forecast.dart';
import 'package:previsao_do_tempo/screeans/home/widgets/week.dart';
import 'package:previsao_do_tempo/shared/find_icon.dart';

class MainScreen extends StatelessWidget {
  final dynamic _data;
  MainScreen(this._data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              vertical: 80,
            ),
            child: Column(
              children: [
                Text(
                  this._data["city"],
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this._data["date"],
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  height: 37,
                ),
                SvgPicture.asset(
                  findIcon(
                    this._data["condition_slug"],
                  ),
                  width: 50,
                ),
                Text(
                  "${this._data["temp"]}º",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  this._data["description"],
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: SvgPicture.asset(
                    "assets/images/vento.svg",
                    height: 32,
                  ),
                ),
                Text(
                  this._data["wind_speedy"],
                ),
                Week(
                  buildWeek(
                    this._data["forecast"],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Forecast> buildWeek(dynamic data) {
    List<Forecast> listWeek = [];
    for (var index = 0; index < 6; index++) {
      listWeek.add(
        Forecast(
          weekday: data[index]["weekday"],
          icon: findIcon(data[index]["condition"]),
          temperature: data[index]["max"],
        ),
      );
    }
    return listWeek;
  }
}
