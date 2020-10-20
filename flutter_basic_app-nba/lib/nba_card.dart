import 'package:basic_flutter_app/nba_model.dart';
import 'nba_detail_page.dart';
import 'package:flutter/material.dart';

class NbaCard extends StatefulWidget {
  final Nba team;

  NbaCard(this.team);

  @override
  _NbaCardState createState() => _NbaCardState(team);
}

class _NbaCardState extends State<NbaCard> {
  Nba team;
  String renderUrl;
  String image;
  int rating;

  _NbaCardState(this.team);

  void initState() {
    super.initState();
    // renderCarPic();
  }

  Widget get nbaImage {
    var nbaAvatar = Hero(
        tag: widget.team,
        child: Container(
          width: 100.0,
          height: 100.0,
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
        ));

    var placeholder = new Container(
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black54, Colors.black, Colors.blueGrey[600]])),
      alignment: Alignment.center,
      child: new Text(
        'TEAM',
        textAlign: TextAlign.center,
      ),
    );

    var crossFade = new AnimatedCrossFade(
      firstChild: nbaAvatar,
      secondChild: placeholder,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: new Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  // void renderCarPic() async {
  //   await car.getImageUrl();
  //   if (mounted) {
  //     setState(() {
  //       renderUrl = car.imageUrl;
  //     });
  //   }
  // }

  Widget get carCard {
    return new Positioned(
      right: 0.0,
      child: new Container(
        width: 290,
        height: 115,
        child: new Card(
          color: Colors.black45,
          child: new Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 64),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(
                  widget.team.name,
                  style: Theme.of(context).textTheme.headline,
                ),
                new Text(
                  widget.team.location,
                  style: Theme.of(context).textTheme.subhead,
                ),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.local_fire_department),
                    new Text(': ${rating}/10')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showCarDetailPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return new NbaDetailPage(
        team: team,
        callbackFunction: updateRating,
      );
    }));
  }

  void updateRating(int newRating) {
    setState(() {
      rating = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    rating = team.rating;

    return new InkWell(
      onTap: () => showCarDetailPage(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: new Container(
          height: 115.0,
          child: new Stack(
            children: <Widget>[
              carCard,
              new Positioned(top: 7.5, child: nbaImage),
            ],
          ),
        ),
      ),
    );
  }
}
