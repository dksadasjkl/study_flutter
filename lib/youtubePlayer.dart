import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; 

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
  static String youtubeId ='2rjNWclIzek';

  final YoutubePlayerController _con = YoutubePlayerController(
    initialVideoId: youtubeId,
    flags: const YoutubePlayerFlags(autoPlay: false),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test App"),
      ),
      body: Container(
        child: YoutubePlayer(controller: _con),
      )
    );
  }
}
