import 'package:flutter/material.dart';
import 'package:http_test/providers/notes_list.dart';
import 'package:http_test/screens/add_screen.dart';
import 'package:http_test/screens/edit_screen.dart';
import 'package:http_test/screens/show_content.dart';
import 'package:http_test/screens/start_screen.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());
bool isArabic = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Notes(),
        )
      ],
      child: MaterialApp(
        title: 'Notes',
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        initialRoute: StartScreen.id,
        routes: {
          StartScreen.id: (context) => StartScreen(),
          AddScreen.id: (context) => AddScreen(),
          ShowScreen.id: (context) => ShowScreen(),
          EditScreen.id: (context) => EditScreen(),
        },
      ),
    );
  }
}
