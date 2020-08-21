import 'package:flutter/material.dart';
import 'package:http_test/models/colors.dart';
import 'package:http_test/screens/show_content.dart';
import 'package:intl/intl.dart';

class GridItem extends StatelessWidget {
  final String g_id;
  final String g_title;
  final String g_content;
  final DateTime g_dateTime;
  GridItem({this.g_content, this.g_dateTime, this.g_id, this.g_title});
  @override
  Widget build(BuildContext context) {
    if (g_title.length >= 100) {
      return GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, ShowScreen.id, arguments: {
            'id': g_id,
            'title': g_title,
            'content': g_content,
            'datetime': g_dateTime,
          });
        },
        child: Column1(
          g_dateTime: g_dateTime,
          g_title: g_title,
        ),
      );
    }
    if (g_title.length < 100 && g_title.length >= 50) {
      return GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, ShowScreen.id, arguments: {
            'id': g_id,
            'title': g_title,
            'content': g_content,
            'datetime': g_dateTime,
          });
        },
        child: Column2(
          g_dateTime: g_dateTime,
          g_title: g_title,
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, ShowScreen.id, arguments: {
            'id': g_id,
            'title': g_title,
            'content': g_content,
            'datetime': g_dateTime,
          });
        },
        child: Column3(
          g_dateTime: g_dateTime,
          g_title: g_title,
        ),
      );
    }
  }
}

class Column1 extends StatelessWidget {
  final String g_title;
  final DateTime g_dateTime;
  Column1({this.g_dateTime, this.g_title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: g_title.length > 120 ? color0 : color5,
        borderRadius: BorderRadius.circular(15),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        var localHeight = constraints.maxHeight;
        var localWidth = constraints.maxWidth;
        return Column(
          children: [
            Text(
              g_title.substring(0, 100),
              style:
                  TextStyle(color: Colors.black, fontSize: localWidth * 0.052),
            ),
            SizedBox(
              height: localWidth * 0.052,
            ),
            Text(
              DateFormat('MMM dd,yyy').format(g_dateTime),
              style:
                  TextStyle(color: Colors.grey, fontSize: localWidth * 0.052),
            ),
          ],
        );
      }),
    );
  }
}

class Column2 extends StatelessWidget {
  final String g_title;
  final DateTime g_dateTime;
  Column2({this.g_dateTime, this.g_title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: g_title.length > 75 ? color1 : color4,
        borderRadius: BorderRadius.circular(15),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        var localHeight = constraints.maxHeight;
        var localWidth = constraints.maxWidth;
        return Column(
          children: [
            Text(
              g_title.substring(0, 50),
              style:
                  TextStyle(color: Colors.black, fontSize: localWidth * 0.16),
            ),
            SizedBox(
              height: localWidth * 0.1,
            ),
            Text(
              DateFormat('MMM dd,yyy').format(g_dateTime),
              style: TextStyle(color: Colors.grey, fontSize: localWidth * 0.12),
            ),
          ],
        );
      }),
    );
  }
}

class Column3 extends StatelessWidget {
  final String g_title;
  final DateTime g_dateTime;
  Column3({this.g_dateTime, this.g_title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: g_title.length > 10 ? color2 : color5,
        borderRadius: BorderRadius.circular(15),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        var localHeight = constraints.maxHeight;
        var localWidth = constraints.maxWidth;
        return Column(
          children: [
            g_title.length > 20
                ? Text(
                    g_title.substring(0, 20),
                    style: TextStyle(
                        color: Colors.black, fontSize: localWidth * 0.12),
                  )
                : Text(
                    g_title,
                    style: TextStyle(
                        color: Colors.black, fontSize: localWidth * 0.12),
                  ),
            SizedBox(
              height: localWidth * 0.1,
            ),
            Text(
              DateFormat('MMM dd,yyy').format(g_dateTime),
              style: TextStyle(color: Colors.grey, fontSize: localWidth * 0.1),
            ),
          ],
        );
      }),
    );
  }
}
