import 'package:basic_flutter_app/nba_card.dart';
import 'package:flutter/material.dart';
import 'nba_model.dart';

class NbaList extends StatelessWidget {
  final List<Nba> team;
  NbaList(this.team);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: team.length,
      itemBuilder: (context, int) {
        return new NbaCard(team[int]);
      },
    );
  }
}
