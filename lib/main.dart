import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

//app entry point

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_alcohol_list',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: TextFieldAlertDialog(),
    );
  }
}

//app entry point end

class TextFieldAlertDialog extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();

  List<Map<String, dynamic>> data = [
    { "id" : 1,  "content" : "Content 1" },
    { "id" : 2,  "content" : "Content 2" },
    { "id" : 3,  "content" : "Content 3" }
  ];

  int _counter = 3;

  _displayDialog(BuildContext context) async {
    print('_displaydialog');
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add alcohol'),
            content: TextField(
              controller: _textFieldController,
              autofocus: true,
              decoration: InputDecoration(labelText: 'Bland Name', hintText: 'ex.hoge beer'),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () => _submission(_textFieldController.text),
              )
            ],
          );
        });
  }
  void _submission(String inputText) {
    print('_submission');
    _counter++;
    data.add({ "id": _counter, "content": inputText});
  }


  @override
  Widget build(BuildContext context) {
    debugPrint('debug');
    return Scaffold(
      appBar: AppBar(
        title: Text('my_alcohol_list'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (int, context) {
          return Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(data[0].toString()),
          );
        },
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(context),
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }

}