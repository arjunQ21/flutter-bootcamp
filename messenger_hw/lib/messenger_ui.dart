import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessengerUI extends StatelessWidget {
  const MessengerUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        title: Text(
          "Chats",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: Icon(
          Icons.menu,
        ),
        actions: [
          Icon(
            Icons.create_outlined,
          )
        ],
      ),
      body: ListView(
        children: [
          Row(
            children: [
              SizedBox(
                width: 90,
                // height: 120,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10000),
                              color: Colors.black,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://xsgames.co/randomusers/assets/avatars/pixel/2.jpg")),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 75,
                          child: Container(
                            height: 17,
                            width: 17,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Arjun Adhikari",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
