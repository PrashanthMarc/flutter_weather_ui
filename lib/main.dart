import 'package:flutter/material.dart';

void main() => runApp(WeatherAPP());

class WeatherAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: WeatherAppUI(),
    );
  }
}

class WeatherAppUI extends StatefulWidget {
  @override
  _WeatherAppUIState createState() => _WeatherAppUIState();
}

class _WeatherAppUIState extends State<WeatherAppUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "India, Hyderabad",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Chip(
                    label: Text(
                      "Today",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Text(
                      "Tomorrow",
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    "Next Week",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              TemperatureNow(
                todayTemperature: "25\u00B0",
                weatherCondition: "Clouds & Sun",
                humidityValue: "35\u00B0",
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Next 15 Days",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    TemperatureCardUI(
                      expectedTemperature: "56\u00B0 - 66\u00B0",
                      temperature: "40\u00B0",
                      weekDay: "Monday",
                      useImage: "images/sun.png",
                      textColor: Colors.white,
                      cardColor: Colors.cyan,
                    ),
                    TemperatureCardUI(
                      expectedTemperature: "56\u00B0 - 66\u00B0",
                      temperature: "40\u00B0",
                      weekDay: "Tuesday",
                      useImage: "images/light.png",
                      assetWidth: 55.0,
                      textColor: Colors.white,
                      cardColor: Colors.blueGrey,
                    ),
                    TemperatureCardUI(
                      expectedTemperature: "56\u00B0 - 66\u00B0",
                      temperature: "40\u00B0",
                      weekDay: "Wednesday",
                      useImage: "images/light_cloud.png",
                      textColor: Colors.white,
                      cardColor: Colors.pink,
                    ),
                    TemperatureCardUI(
                      expectedTemperature: "56\u00B0 - 66\u00B0",
                      temperature: "40\u00B0",
                      weekDay: "Thursday",
                      useImage: "images/rain.png",
                      textColor: Colors.white,
                      cardColor: Colors.orangeAccent,
                    ),
                    TemperatureCardUI(
                      expectedTemperature: "56\u00B0 - 66\u00B0",
                      temperature: "40\u00B0",
                      weekDay: "Friday",
                      useImage: "images/sun.png",
                      textColor: Colors.white,
                      cardColor: Colors.green,
                    ),
                    TemperatureCardUI(
                      expectedTemperature: "56\u00B0 - 66\u00B0",
                      temperature: "40\u00B0",
                      weekDay: "Saturday",
                      useImage: "images/rain.png",
                      textColor: Colors.white,
                      cardColor: Colors.purple,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TemperatureNow extends StatefulWidget {
  final String todayTemperature;
  final String weatherCondition;
  final String humidityValue;

  const TemperatureNow({
    @required this.todayTemperature,
    @required this.weatherCondition,
    @required this.humidityValue,
    Key key,
  }) : super(key: key);

  @override
  _TemperatureNowState createState() => _TemperatureNowState();
}

class _TemperatureNowState extends State<TemperatureNow> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 100.0),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("images/current_weather_background.png"),
            ),
          ),
        ),
        Positioned(
          top: 90.0,
          left: 110.0,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(
                  widget.todayTemperature,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 70.0),
                ),
                Text(
                  widget.weatherCondition,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Humidity",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.humidityValue,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TemperatureCardUI extends StatelessWidget {
  final String useImage;

  final Color textColor;
  final Color cardColor;
  final String temperature;
  final String expectedTemperature;
  final String weekDay;
  final double assetWidth;

  TemperatureCardUI({
    this.textColor = Colors.black,
    this.cardColor = Colors.green,
    this.assetWidth,
    this.expectedTemperature,
    this.weekDay,
    this.useImage,
    this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.3,
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: cardColor,
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 14.0,
                  bottom: 12.0,
                ),
                child: Text(
                  weekDay,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                ),
              ),
              Image.asset(
                useImage,
                width: 60.0,
                height: assetWidth,
              ),
              Text(
                temperature,
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
                maxLines: 1,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: Container(
                    child: Text(
                      expectedTemperature,
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                      maxLines: 1,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
