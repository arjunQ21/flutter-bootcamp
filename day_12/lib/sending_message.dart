import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SendMessagePage extends StatefulWidget {
  const SendMessagePage({super.key});

  @override
  State<SendMessagePage> createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _messageController = TextEditingController();
  List messages = [];

  Future<void> pullLatestMessages() async {
    var response =
        await http.get(Uri.parse("http://192.168.250.114:3000/submissions"));

    // print(response.body);

    var decodedData = jsonDecode(response.body);

    setState(() {
      messages = decodedData["data"]['messages'];
      messages = messages.reversed.toList();
    });
    _scrollToBottom();
  }

  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  void initState() {
    super.initState();
    pullLatestMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Messaging App"),
          actions: [
            IconButton(
                onPressed: () {
                  pullLatestMessages();
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Expanded(
                  child: Container(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: ((context, index) {
                    return ListTile(title: Text(messages[index].toString()));
                  }),
                ),
              )),
              Text("Enter your message:"),
              TextFormField(
                controller: _messageController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Please enter a message";
                  }
                  if (v.trim().length < 5) {
                    return "Please enter a message with at least 5 characters";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // validtion passed
                      print("input data: " + _messageController.text);

//                       String toSend = '''
// {
//   "message": "${_messageController.text}}"
// }''';

                      // print(toSend);

                      Map toSend = {
                        "message": _messageController.text,
                      };

                      _messageController.clear();

                      String toJsonString = jsonEncode(toSend);

                      print(toJsonString);

                      var response = await http.post(
                        Uri.parse("http://192.168.250.114:3000/submit-log"),
                        headers: {
                          "Content-Type": "application/json",
                        },
                        body: toJsonString,
                      );
                      pullLatestMessages();
                      // print(response.body);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please check validation.")));
                    }
                  },
                  child: Text("Send")),
            ]),
          ),
        ),
      ),
    );
  }
}
