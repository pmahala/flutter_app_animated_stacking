import 'package:flutter/material.dart';
import 'ColoredCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<ColoredCard> myCardList = [];
  bool isBlue = true;
  int transformIndex = 0;
  final _myListKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedList(
          key: _myListKey,
          itemBuilder: (context, index, animation) {
            return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: ColoredCard(index: index));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addCard,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void addCard() {
    _myListKey.currentState!.insertItem(transformIndex);

    transformIndex++;
  }
}
