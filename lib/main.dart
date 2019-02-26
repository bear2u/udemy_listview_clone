import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Udemy Clone'),
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
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(1000, (i) => "Item $i");

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return _buildChild(items[index]);
          },
        )
        );
  }

  _buildChild(item) {
    return Container(
      height: 150.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 120.0,
            child: Image.network("https://udemy-images.udemy.com/course/480x270/2171084_186f_3.jpg", fit: BoxFit.fill,),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('모던 리엑트와 리덕스'),
                  Image.asset("assets/badge_bs.png"),
                  Text('Will Park'),
                  Text('4.6'),
                  Text('등록됨')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
