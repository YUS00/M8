import 'package:flutter/material.dart';
import 'nba_model.dart';
import 'dart:async';

class NbaDetailPage extends StatefulWidget {
  final Nba team;
  final Function callbackFunction;

  NbaDetailPage({this.team, this.callbackFunction});

  @override
  _NbaDetailPageState createState() => new _NbaDetailPageState();
}

class _NbaDetailPageState extends State<NbaDetailPage> {
  final double carAvarterSize = 150.0;
  double _sliderValue = 10.0;

  Widget get addYourRating {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                flex: 1,
                child: new Slider(
                  activeColor: Colors.indigoAccent,
                  min: 0.0,
                  max: 10.0,
                  value: _sliderValue,
                  onChanged: (newRating) {
                    setState(() {
                      _sliderValue = newRating;
                      // widget.callbackFunction(newRating.toInt());
                    });
                  },
                ),
              ),
              new Container(
                width: 50.0,
                alignment: Alignment.center,
                child: new Text('${_sliderValue.toInt()}',
                    style: Theme.of(context).textTheme.display1),
              ),
            ],
          ),
        ),
        submitRatingButton,
      ],
    );
  }

  void updateRating() {
    setState(() {
      widget.team.rating = _sliderValue.toInt();
    });
  }

  Future<Null> _ratingErrorDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Error!'),
            content: new Text("They're good teams, dont be a heater."),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Try Again'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  Widget get submitRatingButton {
    return new RaisedButton(
      onPressed: () {
        setState(() {
          updateRating();
        });
      },
      child: new Text('Vote'),
      color: Colors.indigoAccent,
    );
  }

  Widget get carImage {
    return new Hero(
      tag: widget.team,
      child: new Container(
        height: carAvarterSize,
        width: carAvarterSize,
        child: Container(),
        constraints: new BoxConstraints(),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(
                  offset: const Offset(1.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: -1.0,
                  color: const Color(0x33000000)),
              const BoxShadow(
                  offset: const Offset(2.0, 1.0),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  color: const Color(0x24000000)),
              const BoxShadow(
                  offset: const Offset(3.0, 1.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  color: const Color(0x1f000000))
            ],
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: new AssetImage(widget.team.imageUrl ?? ''))),
      ),
    );
  }

  Widget get rating {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.local_fire_department,
          size: 40.0,
        ),
        new Text(
          '${widget.team.rating}/10',
          style: Theme.of(context).textTheme.display2,
        )
      ],
    );
  }

  Widget get nbaProfile {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 32.0),
      decoration: new BoxDecoration(
          image: DecorationImage(
        image: new NetworkImage(
            "https://fsa.zobj.net/crop.php?r=dz8jpmR4aQHvcLbz82QDpOUW8HO9vZmKZELbVgfP33Yra9qcrUena838Jx1wVdGcUaePXDo3JnjQm8rAYmCMTYoGh_sgISi4P1v6mSMwrtErwaDsgFOwadV89mBLCvQFt1WsgKHbiXjXb8X5gT0h836qhQJhnzjan2mqeRjgH_7KywCKKxXbwW9DYMk"),
        fit: BoxFit.cover,
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.5), BlendMode.dstATop),
      )),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          carImage,
          new Text(
            '${widget.team.name}',
            style: TextStyle(fontSize: 32.0),
          ),
          new Text(
            widget.team.location,
            style: TextStyle(fontSize: 20.0),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: new Text(widget.team.description),
          ),
          rating
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        title: new Text('${widget.team.name}'),
      ),
      body: new ListView(
        children: <Widget>[nbaProfile, addYourRating],
      ),
    );
  }
}
