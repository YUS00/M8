import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

class Nba {
  final String name;
  final String location;
  final String description;
  String imageUrl;

  int rating = 10;

  Nba({this.name, this.location, this.description, this.imageUrl});

  void setRating(int newRating) {
    rating = newRating;
  }

  Image getImageUrl() {
    if (imageUrl != null) {
      return Image.asset(imageUrl);
    }

    // HttpClient http = new HttpClient();
    // try {
    //   var uri = new Uri.http('dog.ceo', '/api/breeds/image/random');
    //   var request = await http.getUrl(uri);
    //   var response = await request.close();
    //   var responseBody = await response.transform(utf8.decoder).join();
    //
    //   imageUrl = json.decode(responseBody)['message'];
    // } catch (exception) {
    //   print(exception);
    // }
  }
}
