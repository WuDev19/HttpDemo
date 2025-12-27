import 'package:flutter/material.dart';
import 'package:httpdemo/ModifyProductScreen.dart';

import 'MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Call Api"),
          backgroundColor: Colors.greenAccent,
        ),
        drawer: Builder(
          builder: (context) {
            return Drawer(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ModifyProductScreen(),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Item 1"),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
        body: MyHomePage(),
      ),
    );
  }
}
