import 'package:flutter/material.dart'; 
// Flutter에서 제공하는 Material 디자인 위젯을 사용하기 위한 패키지 임포트

// main 함수: 앱 실행의 시작점 (Java의 main() 함수와 동일한 역할)
void main() {
  runApp(const MyApp()); // MyApp 위젯을 루트 위젯으로 앱 실행
}

// StatelessWidget: 상태가 없는 위젯 (화면 내용이 변하지 않음)
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // 생성자, 부모 클래스에 key 전달

  // build 메서드: 위젯을 화면에 어떻게 그릴지 정의하는 부분
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // 앱의 타이틀 (일부 플랫폼에 표시됨)
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // 앱의 테마 색상 설정 (기본 색상 설정)
      ),
      home: const MyHomePage(), // 앱 시작 시 보여질 첫 번째 화면 (홈 화면)
    );
  }
}

// StatefulWidget: 상태가 있는 위젯 (값이 변경될 수 있음)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key}); // 생성자

  @override
  State<MyHomePage> createState() => _MyHomePageState(); 
  // 상태 객체(State)를 생성해서 연결
}

// 실제 UI와 상태를 다루는 클래스
class _MyHomePageState extends State<MyHomePage> {
  // build 메서드: 이 위젯이 어떻게 화면에 보여질지 정의
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold: 앱 기본 레이아웃 구조 (앱바, 바디, 플로팅버튼 등 포함 가능)
      appBar: AppBar(
        title: const Text("Test Title"), // 상단 앱 바의 제목
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width /2,
                  height: 200,
                  color: Colors.blue,
                ),
                 Container(
                  width: MediaQuery.of(context).size.width /2,
                  height: 200,
                  color: Colors.red,
                )
              ],
            ),
             Row(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                ),
                 Container(
                  width: 200,
                  height: 200,
                  color: Colors.purple,
                )
              ],
            ),
          ],
        )
      ),

    );
  }
}
