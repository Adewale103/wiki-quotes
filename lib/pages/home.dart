import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    return  Scaffold(
        backgroundColor: Colors.blue[400],
        body: SafeArea(
            child: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/yellowbackground.jpg"),
            fit: BoxFit.cover)),
                   child: Padding(
                     padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                     child: Column(
                       children: <Widget> [
                         ElevatedButton.icon(
                             onPressed: () async {
                               await Navigator.pushNamed(context, '/quotes');
                             }, icon: Icon(Icons.menu_book_sharp),
                                label: Text(
                                 "Change Quote Category",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                         ),)),
                        SizedBox(height:20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget> [
                            Flexible(
                             child: Text(
                                data["content"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                            )
                            )
                          ],

            ),
                         SizedBox(height: 20),
                         Text(
                           data["author"],
                           style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 32
                           ),
                         )

                       ],
                     ),
                   )
      ),
      ),

      );
    }
    }
