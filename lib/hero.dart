import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  HeroPage({Key key, this.power, this.speed}) : super(key: key);

  final double power;
  final double speed;

  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  String heroType = 'strong';
  Map<String, List<String>> heroes = {
    'strong':   [ 'Hercules', '2', '1.3' ],
    'superstrong': [ 'Hulk', '3', '1.4' ],
    'overpower': [ 'Superman', '4', '2.5' ],
  };

  void calculateHeroType() {
    double cp = widget.power*widget.power + widget.speed;
    if (cp < 100) {
      heroType = 'strong';
    } else if (cp < 200) {
      heroType = 'superstrong';
    } else {
      heroType = 'overpower';
    }
  }

  @override
  Widget build(BuildContext context) {
    calculateHeroType();
    return Scaffold(
      appBar: AppBar(
        title: Text(heroType),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          child: Text(
                              heroes[heroType][0],
                              style: style,
                          ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          child: Text(
                              'พลัง ${double.parse(heroes[heroType][1])*widget.power}',
                              style: style,
                          ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          child: Text(
                              'ความเร็ว ${double.parse(heroes[heroType][2])*widget.speed}',
                              style: style,
                          ),
                      ),
                    ],
                ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                child: Hero(
                    tag: 'button',
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                                   padding: EdgeInsets.all(12.0),
                                   child: Text('Back', style: TextStyle(fontFamily: 'Montserrat', fontSize: 26.0, color: Colors.white)),
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
