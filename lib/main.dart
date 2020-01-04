import 'package:flutter/material.dart';
import 'MatchCard.dart';

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
  List<Widget> cardList;

  void _removeCard(int index) {
    setState(() {
      cardList.removeAt(index);
    });

    if (cardList.length == 0) {
      cardList = _getMatchCard();
    }
  }

  @override
  void initState() {
    super.initState();
    cardList = _getMatchCard();
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
          children: cardList
        ),
      ),
    );
  }

  List<Widget> _getMatchCard() {
    List<MatchCard> cards = new List();
    cards.add(MatchCard(255, 0, 0, 10));
    cards.add(MatchCard(0, 255, 0, 20));
    cards.add(MatchCard(0, 0, 255, 30));

    List<Widget> cardList = new List();

    for (int x = 0; x < 3; x++) {
      cardList.add(
        Positioned(
          top: cards[x].margin,
          child: Draggable(
            onDragEnd: (drag) {
              _removeCard(x);
            },
            childWhenDragging: Container(),
            feedback: Card(
              elevation: 10.0,
              color: Color.fromARGB(255, cards[x].redColor, cards[x].greenColor, cards[x].blueColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: 350.0,
                height: 500.0,
              ),
            ),
            child: Card(
              elevation: 10.0,
              color: Color.fromARGB(255, cards[x].redColor, cards[x].greenColor, cards[x].blueColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: 350.0,
                height: 500.0,
              ),
            ),
          ),
        ),
      );
    }

    return cardList;
  }
}
