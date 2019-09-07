import 'package:flutter/material.dart';
import 'package:rapido/rapido.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_alcohol_list',
      home: MyHomePageState(),
    );
  }
}

class MyHomePageState extends StatefulWidget {
  MyHomePageState({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageState> {

  DocumentList documentList = DocumentList("task list",
    labels: {"日付": "date", "銘柄名": "task", "種類": "note", "メモ": "text"});

  @override
  Widget build(BuildContext context) {
    return DocumentListScaffold(
      documentList,
      title: "一覧",
      titleKeys: ["date","task","note"],
      subtitleKey: "text",
    );
  }
}