import 'dart:convert';

import 'package:catbox/models/cat.dart';

class CatApi {
  static List<Cat> allCatsFromJson(String jsonData) {
    List<Cat> cats = [];
    json.decode(jsonData)['cats'].forEach((cat) => cats.add(_forMap(cat)));
    return cats;
  }
  
  static Cat _forMap(Map<String, dynamic> map) {
    return Cat(
      externalId: map['id'],
      name: map['name'],
      description: map['description'],
      location: map['location'],
      avatarUrl: map['image_url'],
      likeCounter: map['like_counter'],
      adopted: map['adopted'],
      pictures: List<String>.from(map['pictures']),
      cattributes: List<String>.from(map['cattributes']),
    );
  }
}