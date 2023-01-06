import 'package:day_04/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

final border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20),
  borderSide: BorderSide(
    color: Colors.red,
  ),
);

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      // appBar: SliverAppBar(

      // ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.home),
              Icon(Icons.person),
              Icon(Icons.search),
              Icon(Icons.anchor_outlined),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Text("ABC")),
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.account_balance),
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        elevation: 5,
        title: TextField(
          onChanged: (value) {
            print("Text Changed to: " + value);
            // _scaffoldKey.currentState!.openDrawer();
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            border: border,
            focusedBorder: border,
            errorBorder: border,
            enabledBorder: border,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("Search Tapped");
            },
          ),
          Icon(Icons.filter),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Image.network(
                "https://padxu.com/storage/images/site/logo-aiyana-200x.png"),
            ListTile(
              title: Text("Profile"),
              subtitle: Text("View Your Profile"),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.gps_off),
              onTap: () {
                print("Profile Tapped");
              },
            ),
            ListTile(
              title: Text("Home"),
              subtitle: Text("Goto Home"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.logout),
              onTap: () {
                print("Home Tapped");
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Page 1"),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(150),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Page2()));
                },
                child: Text("Goto page 2")),
          ],
        ),
      ),
    );
  }
}
