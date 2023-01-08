import 'package:day_04/page2.dart';
import 'package:flutter/material.dart';

final border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20),
  borderSide: const BorderSide(
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
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
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
          child: const Text("ABC")),
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.account_balance),
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        elevation: 5,
        title: TextField(
          onChanged: (value) {
            // ignore: avoid_print
            print("Text Changed to: " + value);
            // _scaffoldKey.currentState!.openDrawer();
          },
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
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
            icon: const Icon(Icons.search),
            onPressed: () {
              print("Search Tapped");
            },
          ),
          const Icon(Icons.filter),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Image.network(
                "https://padxu.com/storage/images/site/logo-aiyana-200x.png"),
            ListTile(
              title: const Text("Profile"),
              subtitle: const Text("View Your Profile"),
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.gps_off),
              onTap: () {
                print("Profile Tapped");
              },
            ),
            ListTile(
              title: const Text("Home"),
              subtitle: const Text("Goto Home"),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.logout),
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
            const Text("Page 1"),
            const SizedBox(height: 20),
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
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Page2()));
                },
                child: const Text("Goto page 2")),
          ],
        ),
      ),
    );
  }
}
