import 'package:basic_flutter_app/nba_model.dart';
import 'package:flutter/material.dart';

class AddCarFormPage extends StatefulWidget {
  @override
  _AddCarFormPageState createState() => new _AddCarFormPageState();
}

class _AddCarFormPageState extends State<AddCarFormPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add a new team'),
        backgroundColor: Colors.black87,
      ),
      body: new Container(
        color: Colors.black54,
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: new Column(children: [
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: nameController,
                decoration: new InputDecoration(labelText: 'Name the team'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: locationController,
                decoration: new InputDecoration(labelText: "Team's location"),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: descriptionController,
                decoration: new InputDecoration(labelText: 'Best player'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Builder(
                builder: (context) {
                  return new RaisedButton(
                    // onPressed: () => submitCar(context),
                    color: Colors.indigoAccent,
                    child: new Text('SubmitTeam'),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
