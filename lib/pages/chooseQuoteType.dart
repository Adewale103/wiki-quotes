import 'package:flutter/material.dart';
import 'package:wiki_quotes/services/quoteCategory.dart';
import 'package:wiki_quotes/services/quoteUtils.dart';

class ChooseQuoteType extends StatefulWidget {
  const ChooseQuoteType({super.key});

  @override
  State<ChooseQuoteType> createState() => _ChooseQuoteTypeState();
}

class _ChooseQuoteTypeState extends State<ChooseQuoteType> {
  List<QuoteCategory> categories = [
    QuoteCategory(name:"Random Quote", picture: "random.jpg"),
    QuoteCategory(name: "History/Civil Rights Quote", picture: "law.jpg"),
    QuoteCategory(name: "50-Length-Quote", picture: "50.jpg"),
    QuoteCategory(name: "100-140-Length-Quote", picture: "140.png")
  ];

  void updateQuote(index) async {
    QuoteCategory quoteCategory = categories[index];
    QuoteUtils quoteUtils = QuoteUtils(author: "", content: "", dateAdded: "");
    if(quoteCategory.name == "Random Quote"){
      quoteUtils.getRandomQuote();
    } else if(quoteCategory.name == "History/Civil Rights Quote"){
      quoteUtils.getHistoryQuote();
    } else if(quoteCategory.name == "50-Length-Quote"){
      quoteUtils.getMaxLength50Quote();
    } else if(quoteCategory.name == "100-140-Length-Quote"){
      quoteUtils.getMaxLength140Quote();
    }

    Navigator.pushNamed(context,"/home", arguments: {
     "author" : quoteUtils.author,
      "content" : quoteUtils.content,
      "dateAdded" : quoteUtils.dateAdded
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text("Select Quote Category"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: categories.length,
          itemBuilder: (context, index){
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateQuote(index);
                  },
                  title: Text(categories[index].name,
                  style: TextStyle(
                    fontSize: 20
                  ),),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/${categories[index].picture}"),
                  ),
                ),
              ),
          );
          }
      ),

    );
  }
}
