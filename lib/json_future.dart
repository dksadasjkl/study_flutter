import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static Future loadJson() async {
    final String response = await rootBundle.loadString("lib/users.json");
    final data = await json.decode(response);
    return data['users'];
  }

  Future userList = loadJson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Title"),
      ),
      body: Container(
        child: FutureBuilder(
          future: userList, 
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(15),
                      child: Text("${snapshot.data[index]['id']}: ${snapshot.data[index]['username']}"),
                    );
                });
            } else if (snapshot.hasError) {
              return Center(child: Text("error"),);
            } else {
              return Center(child: CircularProgressIndicator(strokeWidth: 2,),);
            }
          }
          ),
      )
    );
  }
}
