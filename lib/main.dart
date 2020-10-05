import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'hero.dart';

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
      home: MyHomePage(title: 'Flutter Hero Demo'),
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
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  TextEditingController _powerController = TextEditingController();
  TextEditingController _speedController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      //_counter++;
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
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              child: TextField(
                  controller: _powerController,
                  obscureText: false,
                  style: style,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      labelText: 'Enter power',
                      hintText: 'Power',
                      border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              child: TextField(
                  controller: _speedController,
                  obscureText: false,
                  style: style,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      labelText: 'Enter speed',
                      hintText: 'Speed',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)
                          ),
                      ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                child: Hero(
                    tag: 'button',
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return HeroPage(
                                power: double.parse(_powerController.text), 
                                speed: double.parse(_speedController.text)
                            );
                          }));
                        },
                        child: Container(
                                   padding: EdgeInsets.all(12.0),
                                   child: Text('Calculate', style: TextStyle(fontFamily: 'Montserrat', fontSize: 26.0, color: Colors.white)),
                                   decoration: BoxDecoration(
                                       color: Colors.blueAccent,
                                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                   ),
                               ),
                    ),
                ),
            ),
          ],
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      */
    );
  }
}
