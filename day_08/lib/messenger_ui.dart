import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

List<Map<String, String>> activeUsers = [
  {
    "name": "Arjun Prasad Adhikari from Hemja",
    "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/1.jpg"
  },
  {
    "name": "Shyam Karki",
    "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/2.jpg"
  },
  {
    "name": "Yogesh Adhikari",
    "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/3.jpg"
  },
  {
    "name": "Alson Adhikari",
    "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/4.jpg"
  },
  {
    "name": "Bibash Adhikari",
    "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/5.jpg"
  },
  {
    "name": "Rajan Adhikari",
    "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/6.jpg"
  },
  {
    "name": "Suman Adhikari",
    "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/7.jpg"
  },
  {
    "name": "Bipin Adhikari",
    "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/8.jpg"
  },
];

class MessengerUI extends StatelessWidget {
  MessengerUI({super.key});

  List<Map<String, dynamic>> chats = [
    {
      "name": "Arjun Adhikari",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/2.jpg",
      "seen": true,
      "messageTime": "12:34 am",
      "lastMessage": "Khana Vayo?",
      "sentBy": "me",
      "hasMissedCall": false,
      "hasOngoingCall": false,
    },
    {
      "name": "Rajan Aryal",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/3.jpg",
      "seen": false,
      "messageTime": "12:34 am",
      "lastMessage": "Khana Vayo?",
      "sentBy": "other",
      "hasMissedCall": true,
      "hasOngoingCall": true,
    },
    {
      "name": "Sumit Gurung",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/4.jpg",
      "seen": true,
      "messageTime": "1:28 pm",
      "lastMessage": "Khana Vayo?",
      "sentBy": "other",
      "hasMissedCall": false,
      "hasOngoingCall": false,
    },
    {
      "name": "Rajan Aryal",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/5.jpg",
      "seen": false,
      "messageTime": "12:34 am",
      "lastMessage": "Khana Vayo?",
      "sentBy": "other",
      "hasMissedCall": true,
      "hasOngoingCall": false,
    },
    {
      "name": "Rajan Aryal",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/6.jpg",
      "seen": false,
      "messageTime": "12:34 am",
      "lastMessage": "Khana Vayo?",
      "sentBy": "other",
      "hasMissedCall": true,
      "hasOngoingCall": false,
    },
    {
      "name": "Rajan Aryal",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/7.jpg",
      "seen": false,
      "messageTime": "12:34 am",
      "lastMessage": "Khana Vayo?",
      "sentBy": "other",
      "hasMissedCall": true,
      "hasOngoingCall": false,
    },
    {
      "name": "Rajan Aryal",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/8.jpg",
      "seen": false,
      "messageTime": "12:34 am",
      "lastMessage": "Khana Vayo?",
      "sentBy": "other",
      "hasMissedCall": true,
      "hasOngoingCall": false,
    },
    {
      "name": "Rajan Aryal",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/9.jpg",
      "seen": false,
      "messageTime": "12:34 am",
      "lastMessage": "Khana Vayo?",
      "sentBy": "other",
      "hasMissedCall": true,
      "hasOngoingCall": false,
    },
    {
      "name": "Rajan Aryal",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/10.jpg",
      "seen": false,
      "messageTime": "12:34 am",
      "lastMessage": "Khana Vayo?",
      "sentBy": "other",
      "hasMissedCall": true,
      "hasOngoingCall": false,
    },
    {
      "name": "Rajan Aryal",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/11.jpg",
      "seen": false,
      "messageTime": "12:34 am",
      "lastMessage": "Khana Vayo?",
      "sentBy": "other",
      "hasMissedCall": true,
      "hasOngoingCall": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    const searchButtonBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          "Chats",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.create),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: searchButtonBorder,
                  enabledBorder: searchButtonBorder,
                  errorBorder: searchButtonBorder,
                  focusedBorder: searchButtonBorder,
                  iconColor: Colors.grey,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < activeUsers.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: SizedBox(
                        width: 120,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        activeUsers[i]["profileURL"]!,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                Positioned(
                                  right: 3,
                                  bottom: 10,
                                  child: Container(
                                    height: 23,
                                    width: 23,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 4,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 40,
                                child: Text(
                                  activeUsers[i]["name"]!,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            for (var chat in chats)
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8,
                    ),
                    child: Row(
                      // mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    chat['profileURL']!,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              height: 60,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    chat["name"]!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: chat['seen']!
                                          ? FontWeight.normal
                                          : FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      if (chat['hasMissedCall']!)
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.phone_callback_rounded,
                                              color: Colors.red,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                "Missed Call",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      else
                                        Text(
                                          (chat['sentBy']! == "me"
                                                  ? "You: "
                                                  : "") +
                                              chat["lastMessage"]!,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        size: 6,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text("2:13 pm"),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Text("asasdfasdfasdfdfasdfasdfasf"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 30,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (chat['hasOngoingCall']!)
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 12,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    child: Text(
                                      "Join",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (chat['hasMissedCall']!)
                          Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.call,
                                size: 32,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        if (!chat['seen']!)
                          Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
