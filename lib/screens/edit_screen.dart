import 'package:flutter/material.dart';
import 'package:http_test/main.dart';
import 'package:http_test/providers/notes_list.dart';
import 'package:http_test/screens/show_content.dart';
import 'package:http_test/screens/start_screen.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  static const String id = 'kdjfdfkj';

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var data;
  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context).settings.arguments as Map;
    c1.text = data['title'];
    c2.text = data['content'];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    c1.dispose();
    c2.dispose();
    super.dispose();
  }

  var c1 = TextEditingController();
  var c2 = TextEditingController();
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
                          Navigator.pop(context);
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
                          child: IconButton(
                            icon: Icon(Icons.save),
                            onPressed: () {
                              Provider.of<Notes>(context, listen: false)
                                  .updateNote(data['id'], c1.text, c2.text,
                                      data['datetime']);

                              Navigator.pushReplacementNamed(
                                  context, StartScreen.id);
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
                TextField(
                  textDirection:
                      isArabic ? TextDirection.rtl : TextDirection.ltr,
                  maxLines: 5,
                  controller: c1,
                  onSubmitted: (newValue) {
                    setState(() {
                      data['title'] = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  textDirection:
                      isArabic ? TextDirection.rtl : TextDirection.ltr,
                  maxLines: 500,
                  controller: c2,
                  onSubmitted: (newValue) {
                    setState(() {
                      data['content'] = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
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
