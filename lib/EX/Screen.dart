import 'package:dummy/EX/Store_data.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home_Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.teal),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Appdata()));
        },
      ),
    );
  }
}
