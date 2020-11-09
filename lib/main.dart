import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saving data'),
      ),
      body: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Read'),
              onPressed: () {
                _read();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Save'),
              onPressed: () {
                _save();
              },
            ),
          ),
        ],
      ),
    );
  }

  // Replace these two methods in the examples that follow

  _read() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/my_file.txt');
      String text = await file.readAsString();
      print(text);
    } catch (e) {
      print("Couldn't read file");
    }
  }

  _save() async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    final file = File('${directory.path}/my_file.txt');
    final text = 'Hello World!';
    await file.writeAsString(text);
    print('saved');
  }
}
