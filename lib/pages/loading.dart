import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wiki_quotes/services/quoteUtils.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpRandomQuote() async {
    QuoteUtils quoteUtils = QuoteUtils(author: "a", content: "b", dateAdded: "c");
    await quoteUtils.getRandomQuote();
    Navigator.pushNamed(context, "/home", arguments: {
      "author" : quoteUtils.author,
      "content" : quoteUtils.content,
      "dateAdded" : quoteUtils.dateAdded
    } );
  }

  @override
  void initState() {
    super.initState();
    setUpRandomQuote();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: const Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
