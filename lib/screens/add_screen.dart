import 'package:flutter/material.dart';
import 'package:http_test/main.dart';
import 'package:http_test/providers/notes_list.dart';
import 'package:http_test/screens/start_screen.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  static const String id = 'addscreensdf';

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var titleController = TextEditingController();

  var contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
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
                        IconButton(
                          icon: isArabic
                              ? Icon(Icons.format_align_left)
                              : Icon(Icons.format_align_right),
                          onPressed: () {
                            setState(() {
                              isArabic = !isArabic;
                            });
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF3B3B3B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Builder(
                            builder: (context) => FlatButton(
                              child: Text(
                                'Save',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                if (titleController.text == '' ||
                                    contentController.text == '') {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('Please fill all Values'),
                                  ));
                                } else {
                                  Provider.of<Notes>(context, listen: false)
                                      .addNote(
                                          DateTime.now().toString(),
                                          titleController.text,
                                          contentController.text,
                                          DateTime.now());
                                  Navigator.pushReplacementNamed(
                                      context, StartScreen.id);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  textDirection:
                      isArabic ? TextDirection.rtl : TextDirection.ltr,
                  controller: titleController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 30,
                        fontFamily: 'font1'),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  textDirection:
                      isArabic ? TextDirection.rtl : TextDirection.ltr,
                  controller: contentController,
                  maxLines: 500,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type Something...!',
                    hintStyle: TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 30,
                        fontFamily: 'font1'),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
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
