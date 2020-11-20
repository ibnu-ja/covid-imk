import 'package:flutter/material.dart';

class WorldModel {
  final String newconfirmed;
  final String totalconfirmed;
  final String newrecovered;
  final String totalrecovered;
  final String newdeaths;
  final String totaldeaths;

  WorldModel({
    this.newconfirmed,
    this.totalconfirmed,
    this.newrecovered,
    this.totalrecovered,
    this.newdeaths,
    this.totaldeaths,
  });
}
