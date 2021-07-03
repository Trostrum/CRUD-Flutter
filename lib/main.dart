import 'package:flutter/material.dart';
import 'splash.dart';
import 'parse.dart';
import 'contact.dart';

// ignore: deprecated_member_use
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/second': (context) => MainApp(),
      '/third': (context) => MyApp(),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Runner',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.teal,
      ),
      home: new MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Menu"),
        elevation: 10,
        backgroundColor: Colors.black38,
      ),
      drawer: Container(
        width: 200,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 70.0,
                child: DrawerHeader(
                  child: Center(child: Text('Terminal Exam')),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                  ),
                ),
              ),
              ListTile(
                title: Text('CRUD'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Parser()),
                  );
                },
              ),
              ListTile(
                title: Text('Contact Us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Contact()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    tileColor: Colors.amber,
                    leading: Icon(Icons.album),
                    title: Text('CRUD'),
                    subtitle: Text('Play With Trostrum\'s MySQL'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Let\'s Play'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Parser()),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
