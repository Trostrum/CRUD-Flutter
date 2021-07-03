import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {

  //   _launchURL() async {
  //   const url = 'https://ammart.net';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Us'),
          elevation: 10,
          backgroundColor: Colors.black38,
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Buy Me a Cup o' Coffee",
              style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0)),
            SizedBox(
              height: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black38, // background
                    onPrimary: Colors.white,
                  ),
                  onPressed:(){},
                  // onLongPress: _launchURL,
                  child: new Text("Visit My Website",
                      style: new TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold))),
            ),
          ],
        )));
  }
}
