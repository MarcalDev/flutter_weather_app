import 'package:flutter/material.dart';
import 'package:flutter_weather_app/2-app/views/citySelector/pages/CitySelectorPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget headerSection = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Today, 01 June",
                style: TextStyle(
                    fontFamily: 'ProximaNova',
                  fontSize: 13
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                        Icons.place_sharp,
                        size: 22,
                      ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Bauru",
                        style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 20
                        ),
                      ),
                    ) ,
                    GestureDetector(
                      child: Icon(Icons.keyboard_arrow_down_rounded),
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CitySelectorPage())
                        );
                      },
                    ),
                  ],
                ),
                Icon(
                    Icons.edit_calendar_outlined,
                    size: 25,
                ),
              ],
            )
          ],
        );
    Widget metricsSection = IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _mainMetricsColumn("Wind","234"),
          VerticalDivider(
            color: Colors.black12,
            thickness: 2,
          ),
          _mainMetricsColumn("Temperature","28°C"),
          VerticalDivider(
            color: Colors.black12,
            thickness: 2,
          ),
          _mainMetricsColumn("Humidity","79%"),
        ],
      ),
    ) ;
    Widget metricsByTimeSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _metricsByTimeCard('images/cloudSun.png', "12:00", "35°C"),
        _metricsByTimeCard('images/cloudSun.png', "14:30", "28°C"),
        _metricsByTimeCard('images/cloudSun.png', "17:00", "32°C"),
        _metricsByTimeCard('images/cloudSun.png', "19:30", "25°C"),
      ],
    );
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(35,80,35,0),
            child:  headerSection,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,35,0,10),
            child: Image.asset(
              'images/cloudSun.png',
              height: 190,
            ),
          ) ,
          Text(
            "Cloudy",
            style: TextStyle(
              fontSize: 35,
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(35,0,35,0),
            child: metricsSection,
          ),
          Card(
            margin: EdgeInsets.all(0),
            color: Color(0xff2d27dd),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                   child: Divider(
                     color: Colors.white,
                     thickness: 3,
                     endIndent: 130,
                     indent: 130,
                   ),
                  ) ,
                  metricsByTimeSection,
                ],
              ),
            )
          ),
        ],
      )
      );
  }
  Column _mainMetricsColumn(String title, String value){
    return Column(
      children: [
        Text(
            title,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: 'ProximaNova',
                color: Colors.black54
            ),
        ),
        Text(
            value,
            style: const TextStyle(
                fontSize: 25,
              fontFamily: 'ProximaNova',
                fontWeight: FontWeight.bold,
            ),
        ),
      ],
    );
  }

  Card _metricsByTimeCard(String image, String time, String temperature){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15)),
      color: Color(0xff3330f2),
      shadowColor: Colors.transparent,

      child: Padding(
        padding: EdgeInsets.fromLTRB(15,20,15,20),
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
