import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bigTextStyle = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    );
    var boxWidth = 150.0;
    var smallBoxHeight = 120.0;
    var underlinedText = TextStyle(decoration: TextDecoration.underline);
    var boxStyle = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          offset: Offset(0, 4),
          blurRadius: 23,
          spreadRadius: 0,
        ),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Weather Widget")),
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(25),
                    width: boxWidth,
                    height: smallBoxHeight,
                    decoration: boxStyle,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "12 C",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Cloudy Day".toUpperCase(),
                          style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      padding: EdgeInsets.all(25),
                      width: boxWidth,
                      height: smallBoxHeight,
                      decoration: boxStyle,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Alarm".toUpperCase()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "11:45",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "AM",
                                style: TextStyle(
                                    // fontSize: 1,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "M",
                              ),
                              Text(
                                "T",
                              ),
                              Text(
                                "W",
                              ),
                              Text(
                                "T",
                                style: underlinedText,
                              ),
                              Text(
                                "F",
                              ),
                              Text(
                                "S",
                                style: underlinedText,
                              ),
                              Text(
                                "S",
                                style: underlinedText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(25),
                width: boxWidth,
                height: smallBoxHeight * 2 + 15,
                decoration: boxStyle,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "22",
                      style: bigTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        "..",
                        style: bigTextStyle,
                      ),
                    ),
                    Text(
                      "56",
                      style: bigTextStyle,
                    ),
                    Text("MON, 2 MAY, 2022"),
                    Text("RAY"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
