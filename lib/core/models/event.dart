import 'package:flutter/cupertino.dart';

class Event {
  String title;
  String stratTime;
  String endTime;
  String? description;
  Color? color;
  String? imageLink;

  Event(this.title, this.stratTime, this.endTime, this.description, this.color,this.imageLink);
}
