import 'package:flutter/material.dart'; 

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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState () { 
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(
      () => setState(() => _selectedIndex = _tabController.index));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App"),
      ),
      body: _selectedIndex == 0 
        ? tabContainer(context, Colors.indigo, "Friends Tab")
        : _selectedIndex == 1
          ? tabContainer(context, Colors.amber, "Chats Tab") 
          : tabContainer(context, Colors.blueGrey, "Settings Tab"),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          tabs: [
            Tab(
              icon: Icon(Icons.person),
              text: "Friends",
            ),
            Tab(
              icon: Icon(Icons.chat),
              text: "Chats",
            ),
            Tab(
              icon: Icon(Icons.settings),
              text: "Settings",
            ),
          ],
        ),
      ),
    );
  }

  Widget tabContainer(BuildContext con, Color tabColor, String tabText){
    return Container(
      width: MediaQuery.of(con).size.width,
      height: MediaQuery.of(con).size.height,
      color: tabColor,
      child: Center(
        child: Text(
          tabText,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
