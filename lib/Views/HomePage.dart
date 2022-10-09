import 'package:flutter/material.dart';

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
                  fontSize: 13
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                        Icons.pin_drop_sharp,
                        size: 22,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Rio de Janeiro",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ) ,
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                Icon(
                    Icons.calendar_month,
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
      backgroundColor: Color(0xfff2f9f8),
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
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(35,0,35,0),
            child: metricsSection,
          ),
          Card(
            color: Color(0xff2d27dd),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                   child: Divider(
                     color: Colors.grey,
                     thickness: 4,
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
                color: Colors.black54
            ),
        ),
        Text(
            value,
            style: const TextStyle(
                fontSize: 25,
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
                color: Colors.white
              ),
            ),
            Text(
                temperature,
                style: TextStyle(
                    color: Colors.white
                ),
            ),
          ],
        ),
      ),
      
    );

  }

}
