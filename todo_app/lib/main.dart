import 'package:day4/theory.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        backgroundColor: Colors.grey.shade100,
      ),
      routes: {
        '/theory': (context) => const TheoryPage(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController task = TextEditingController();
  List<String> tasks = [];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text("To Do List"),
      ),
      drawer: Drawer(
        child: Column(
          children: const <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Alson Garbuja'),
              accountEmail: Text('magar33alson@gmail.com'),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://avatars.githubusercontent.com/u/42911859?v=4"),
                  fit: BoxFit.cover,
                ),
                color: Colors.blueGrey,
                backgroundBlendMode: BlendMode.darken,
              ),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Task'),
              subtitle: Text('All task'),
              dense: true,
            ),
            ListTile(
              leading: Icon(Icons.plagiarism_rounded),
              title: Text('Search'),
              subtitle: Text('All task'),
              dense: true,
            ),
            ListTile(
              leading: Icon(Icons.settings_rounded),
              title: Text('Settings'),
              subtitle: Text('Change your prefrences'),
              dense: true,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade300,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(2, 3),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    '''Manage your 
Time Well''',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/time.png'),
                    height: 80,
                  ),
                ],
              ),
            ),
            TextFormField(
              controller: task,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                isCollapsed: true,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    tasks.clear();
                  });
                },
                child: const Text(
                  'Clear All',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border(
                        left: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        right: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        top: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        bottom: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(tasks[index]),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (task.text.isNotEmpty) {
            tasks.add(task.text);
            task.clear();
            setState(() {});
          }
        },
        // mini: true,
        isExtended: true,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: (index) => setState(() {
          _currentPage = index;
        }),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: '',
          ),
        ],
      ),
    );
  }
}
