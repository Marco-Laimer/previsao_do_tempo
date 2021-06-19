import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:previsao_do_tempo/models/forecast.dart';
import 'package:previsao_do_tempo/shared/find_icon.dart';

class Week extends StatelessWidget {
  final List<Forecast> forecastList;

  Week(this.forecastList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 58,
        child: ListView.builder(
          itemBuilder: builder,
          itemCount: this.forecastList.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget builder(BuildContext context, int index) {
    Forecast forecast = this.forecastList.elementAt(index);
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        children: [
          Text(
            forecast.weekday,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: SvgPicture.asset(
              forecast.icon,
              width: 20,
            ),
          ),
          Text(
            "${forecast.temperature}º",
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
