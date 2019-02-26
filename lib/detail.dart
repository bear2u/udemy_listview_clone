import 'package:flutter/material.dart';
import 'package:udemy_listview_clone/item.dart';

class DetailScreen extends StatefulWidget {
  final Item item;

  DetailScreen({this.item});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final titleTheme =
        Theme.of(context).textTheme.title.copyWith(fontSize: 30.0);
    final subTheme =
        Theme.of(context).textTheme.subtitle.copyWith(fontSize: 20.0);
    final description = Theme.of(context).textTheme.body1;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Container(
                color: Colors.red,
                child: Text('video'),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    widget.item.title,
                    style: titleTheme,
                  ),
                  Text(
                    widget.item.author,
                    style: subTheme,
                  ),
                  Container(
                      padding:
                          EdgeInsets.only(left: 8.0, right: 8.0, bottom: 3.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '강의 소개',
                        style: description,
                      )),
                  Divider(),
                  _buildSubList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildSubList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 1000,
        itemBuilder: (context, index) => _buildSubContainer());
  }

  _buildSubContainer() {
    return new _ItemWidget();
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: Text('1'),
            ),
            flex: 1,
          ),
          Expanded(
            child: Text('강의 소개'),
            flex: 9,
          ),
          Expanded(
            child: Image.asset(
              "assets/ic_download.png",
              width: 30.0,
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
