import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tinder Swipe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Tinder Swipe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          // カードの配置をtopでずらす。
          // 手前のカードほどカードを大きくするようにするため、手前程widthを広げる。
          children: <Widget>[
            Positioned(
              top: 10.0,
              child: Card(
                elevation: 10.0,
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 310.0,
                  height: 500.0,
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              child: Card(
                elevation: 10.0,
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 330.0,
                  height: 500.0,
                ),
              ),
            ),
            Positioned(
              top: 30.0,
              child: Card(
                elevation: 10.0,
                color: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 350.0,
                  height: 500.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
