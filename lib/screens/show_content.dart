import 'package:flutter/material.dart';
import 'package:http_test/providers/notes_list.dart';
import 'package:http_test/screens/edit_screen.dart';
import 'package:http_test/screens/start_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ShowScreen extends StatelessWidget {
  static const String id = 'sdddsddd';
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF3B3B3B),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, StartScreen.id);
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF3B3B3B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              Provider.of<Notes>(context, listen: false)
                                  .deleteNote(data['id']);

                              Navigator.pushReplacementNamed(
                                  context, StartScreen.id);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF3B3B3B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.pushNamed(context, EditScreen.id,
                                  arguments: data);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['title'],
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        DateFormat('MMMM dd,yyyy').format(data['datetime']),
                        style:
                            TextStyle(color: Color(0xFF919191), fontSize: 20),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        data['content'],
                        style: TextStyle(fontSize: 23),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
