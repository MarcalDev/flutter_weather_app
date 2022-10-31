import 'package:flutter/material.dart';

class MetricsByTimeCard extends StatelessWidget {
  const MetricsByTimeCard({
    Key key,
    this.image,
    this.time,
    this.temperature
}) : super(key:key);
  final String image;
  final String time;
  final String temperature;

  @override
  Widget build(BuildContext context){
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(15)),
        color: Color(0xff3330f2),
        shadowColor: Colors.transparent,

        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 35,
              ),
              Text(
                time,
                style: TextStyle(
                    fontFamily: 'ProximaNova',
                    color: Colors.white
                ),
              ),
              Text(
                temperature,
                style: TextStyle(
                    fontFamily: 'ProximaNova',
                    color: Colors.white
                ),
              ),
            ],
          ),
        ),

      );
    }

  }
