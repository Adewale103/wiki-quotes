import 'package:flutter/material.dart';
import 'package:wiki_quotes/pages/home.dart';
import 'package:wiki_quotes/pages/loading.dart';
import 'package:wiki_quotes/pages/chooseQuoteType.dart';
void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/" : (context) => Loading(),
    "/home" : (context) => Home(),
    "/quotes" : (context) => ChooseQuoteType()
  }
));
