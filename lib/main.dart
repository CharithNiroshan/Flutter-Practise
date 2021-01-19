import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Widget Testing Assignment'),
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
  String label = "";
  String name = "";
  bool buttonstate = false;
  final _formKey = GlobalKey<FormState>();

  void onSubmit() {
    setState(() {
      label = name;
      buttonstate = !buttonstate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              buttonstate ? "Your Name is " + label : "Enter your name",
              style: new TextStyle(fontSize: 22),
            ),
            Visibility(
              visible: !buttonstate,
              child : Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 35),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Form(
                  key: _formKey,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                )))
            ,
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child :FlatButton(
                onPressed: () => {onSubmit()},
                color: Colors.blue,
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Text(
                      buttonstate ? "Go Back" : "Submit",
                      style: new TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
              ), 
            )
          ],
        ),
      ),
    );
  }
}
