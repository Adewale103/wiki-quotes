import 'package:http/http.dart';
import 'dart:convert';

class QuoteUtils {
  String author;
  String content;
  String dateAdded;
  String randomQuoteLink = "https://api.quotable.io/random";
  String historyQuoteLink = "https://api.quotable.io/random?tags=technology,famous-quotes";
  String maxLength50Link = "https://api.quotable.io/random?maxLength=50";
  String maxLength140Link = "https://api.quotable.io/random?minLength=100&maxLength=140";

  QuoteUtils({ required this.author, required this.content, required this.dateAdded});

  Future<void> getQuote(String quoteLink) async{
    try {
      Response response = await get(quoteLink);
      Map data = jsonDecode(response.body);
      author = data["author"];
      content = data["content"];
      dateAdded = data["dateAdded"];
    }
    catch(e){
      print('An error occurred: $e');
    }
  }

  Future<void> getRandomQuote() async{
      await getQuote(randomQuoteLink);
  }
  Future<void> getHistoryQuote() async{
    await getQuote(historyQuoteLink);
  }

  Future<void> getMaxLength50Quote() async{
    await getQuote(maxLength50Link);
  }

  Future<void> getMaxLength140Quote() async{
    await getQuote(maxLength140Link);
  }
}