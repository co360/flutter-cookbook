import 'package:flutter/material.dart';
import 'package:flutter_layout/immutable_widget.dart';
import 'package:flutter_layout/text_layout.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('Welcome to Flutter'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.edit),
            )
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Image.asset('assets/beach.jpg'), TextLayout()],
      ),
      drawer: Drawer(
        //side bar
        child: Container(
          color: Colors.lightBlue,
          child: Center(
            child: const Text("I'm a Drawer!"),
          ),
        ),
      ),
    );
  }
}
