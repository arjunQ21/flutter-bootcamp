import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpBasicPage extends StatefulWidget {
  const HttpBasicPage({super.key});

  @override
  State<HttpBasicPage> createState() => _HttpBasicPageState();
}

class _HttpBasicPageState extends State<HttpBasicPage> {
  @override
  void initState() {
    getDataFromInternet();
    super.initState();
  }

  Future<void> getDataFromInternet() async {
    var data =
       await  http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    print(data.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Hi")),
    );
  }
}
