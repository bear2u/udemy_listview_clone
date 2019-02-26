import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

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
    final TitleTheme = Theme.of(context).textTheme.title;
    final subTheme = Theme.of(context).textTheme.subtitle;
    final description = Theme.of(context).textTheme.body1;
    final boldDescription = Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold);
    return Container(
      height: 150.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            width: 150.0,
            child: Image.network("https://udemy-images.udemy.com/course/480x270/2171084_186f_3.jpg", fit: BoxFit.fill,),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 0, top: 8.0, bottom: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('모던 리엑트와 리덕스', style: TitleTheme,),
                  Image.asset("assets/badge_bs.png", width: 110.0,),
                  Text('Will Park', style: subTheme,),
                  Row(
                    children: <Widget>[
                      StarRating(rating: 3.0, size: 20.0, color: Colors.amber,),
                      Text('4.6', style: boldDescription,),
                      Text('(109)', style: description,)
                    ],
                  ),
                  Text(r'$13,000', style: boldDescription,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
