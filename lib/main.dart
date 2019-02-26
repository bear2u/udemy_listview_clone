import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:udemy_listview_clone/detail.dart';
import 'package:udemy_listview_clone/item.dart';

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
  List<Item> items = [];

  _buildItems() {
    items.add(Item(
        thumbnail:
            "https://udemy-images.udemy.com/course/480x270/2171084_186f_3.jpg",
        title: "Flutter 입문",
        isBestSeller: true,
        author: "입문자",
        ranking: 4.5,
        hit: 1200,
        price: "13,000"));

    items.add(Item(
        thumbnail:
            "https://udemy-images.udemy.com/course/480x270/1575278_a828_3.jpg",
        title: "Flutter 입문",
        isBestSeller: false,
        author: "입문자",
        ranking: 3.0,
        hit: 1200,
        price: "13,000"));

    items.add(Item(
        thumbnail:
            "https://udemy-images.udemy.com/course/480x270/2171084_186f_3.jpg",
        title: "Flutter 입문",
        isBestSeller: true,
        author: "입문자",
        ranking: 4.5,
        hit: 1200,
        price: "13,000"));

    items.add(Item(
        thumbnail:
            "https://udemy-images.udemy.com/course/480x270/1708340_7108_2.jpg",
        title: "Flutter 입문",
        isBestSeller: false,
        author: "입문자",
        ranking: 2.0,
        hit: 1200,
        price: "13,000"));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _buildItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetailScreen(item: items[index])));
            },
            child: _buildChild(items[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          items.add(Item(
              thumbnail:
                  "https://udemy-images.udemy.com/course/480x270/2171084_186f_3.jpg",
              title: "Flutter 입문",
              isBestSeller: true,
              author: "입문자",
              ranking: 4.5,
              hit: 1200,
              price: "13,000"));
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _buildChild(Item item) {
    final titleTheme = Theme.of(context).textTheme.title;
    final subTheme = Theme.of(context).textTheme.subtitle;
    final description = Theme.of(context).textTheme.body1;
    final boldDescription =
        Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold);
    return Container(
      height: 150.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Image.network(
                item.thumbnail,
                fit: BoxFit.fill,
              ),
            ),
            flex: 4,
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding:
                  EdgeInsets.only(left: 0, top: 8.0, bottom: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    item.title,
                    style: titleTheme,
                  ),
                  item.isBestSeller
                      ? Image.asset(
                          "assets/badge_bs.png",
                          width: 110.0,
                        )
                      : Container(),
                  Text(
                    item.author,
                    style: subTheme,
                  ),
                  Row(
                    children: <Widget>[
                      StarRating(
                          rating: item.ranking,
                          size: 20.0,
                          color: Colors.amber),
                      Text(
                        '${item.ranking}',
                        style: boldDescription,
                      ),
                      Text(
                        '(${item.hit})',
                        style: description,
                      )
                    ],
                  ),
                  Text(
                    r'$' + item.price,
                    style: boldDescription,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
