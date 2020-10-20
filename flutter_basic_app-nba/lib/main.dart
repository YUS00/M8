import 'package:flutter/material.dart';
import 'dart:async';
import 'nba_model.dart';
import 'nba_list.dart';
import 'new_nba_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nba Teams',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'Nba Teams',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Nba> initialNbaTeams = []
    ..add(Nba(
        name: 'Golden State',
        location: 'San Francisco',
        description: 'Stephen Curry ',
        imageUrl: 'lib/assets/images/golden.jpg'))
    ..add(Nba(
        name: 'Los Angeles Lakers',
        location: 'Los Angeles',
        description: 'Lebron James',
        imageUrl: 'lib/assets/images/lakers.jpg'))
    ..add(Nba(
        name: 'Boston Celtics',
        location: 'Boston',
        description: 'Jason Tatum',
        imageUrl: 'lib/assets/images/boston.jpg'))
    ..add(Nba(
        name: 'Houston Rockets',
        location: 'Houston',
        description: 'James Harden',
        imageUrl: 'lib/assets/images/rockets.jpg'))
    ..add(Nba(
        name: 'Mavericks',
        location: 'Dallas',
        description: 'Luka Doncic',
        imageUrl: 'lib/assets/images/mavs.jpg'))
    ..add(Nba(
        name: 'Brooklyn Nets',
        location: 'Brooklyn',
        description: 'Kevin Durant',
        imageUrl: 'lib/assets/images/nets.jpg'))
    ..add(Nba(
        name: 'Atlanta',
        location: 'Atlanta Hawks',
        description: 'Trae Young',
        imageUrl: 'lib/assets/images/hawks.jpg'));

  Future _showNewCarForm() async {
    Nba newteam = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddCarFormPage();
    }));
    if (newteam != null) {
      initialNbaTeams.add(newteam);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: Center(child: new Text(widget.title)),
        backgroundColor: Colors.black54,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewCarForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
              image: DecorationImage(
            image: new NetworkImage(
                "https://www.wallpapertip.com/wmimgs/73-735393_nba-wallpaper-for-phone.jpg"),
            fit: BoxFit.cover,
          )),
          child: new Center(
            child: new NbaList(initialNbaTeams),
          )),
    );
  }
}
