import 'package:flutter/material.dart';
import 'package:rapido/rapido.dart';
import 'package:package_info/package_info.dart';

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
  DocumentList documentList = DocumentList("my_alcohol_list",
      labels: {"日付": "date", "銘柄名": "task", "種類": "note", "メモ": "text"});

  @override
  Widget build(BuildContext context) {
    return DocumentListScaffold(
      documentList,
      additionalActions: <Widget>[
        IconButton(icon: Icon(Icons.arrow_upward), onPressed: exportAlcoholList)
      ],
      emptyListWidget: Center(
        child: Text("Click the add button to create your drink list"),
      ),
      customItemBuilder: customItemBuilder,
    );
  }

  Widget customItemBuilder(int index, Document doc, BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      child: Column(
        children: <Widget>[
          Text(
            doc["date"],
            style: textTheme.display1,
          ),
          Text(
            doc["task"],
            style: textTheme.headline,
          ),
          Text(
            doc["note"],
            style: textTheme.subhead,
          ),
          Text(
            doc["text"],
            style: textTheme.headline,
          ),
          DocumentActionsButton(documentList, index: index),
        ],
      ),
    );
  }
  
  void exportAlcoholList() {
    PackageInfo.fromPlatform().then((packageInfo) {
      showAboutDialog(
        context: context,
        applicationName: packageInfo.appName,
        applicationVersion: packageInfo.version,
      );
    });
  }

}