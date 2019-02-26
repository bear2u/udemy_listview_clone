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
            return ListTile(
              title: _buildChild(items[index]),
            );
          },
        )
        );
  }

  _buildChild(item) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.red,
            child: Text('사진'),
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Text('내용'),
          ),
          flex: 8,
        )
      ],
    );
  }
}
