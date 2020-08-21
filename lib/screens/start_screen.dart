import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http_test/providers/notes_list.dart';
import 'package:http_test/screens/add_screen.dart';
import 'package:http_test/widgets/grid_item.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  static const String id = 'sartScreenid';

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool isSearching = false;
  var _filteredNores = [];
  @override
  Widget build(BuildContext context) {
    List<Note> _notes = Provider.of<Notes>(context).notes;

    _onSearch(value) {
      setState(() {
        _filteredNores = _notes.where((e) => e.title.contains(value)).toList();
      });
      print(_filteredNores.length);
      print(_filteredNores);
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF252525),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(AddScreen.id);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isSearching
                      ? Expanded(
                          child: TextField(
                            onChanged: _onSearch,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type to search...',
                              hintStyle: TextStyle(
                                  color: Color(0xFF929292),
                                  fontSize: 28,
                                  fontFamily: 'font1'),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        )
                      : Text(
                          'Notes',
                          style: TextStyle(fontSize: 35),
                        ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF3B3B3B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(
                        isSearching ? Icons.cancel : Icons.search,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          isSearching = !isSearching;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            !isSearching
                ? FutureBuilder(
                    future: Provider.of<Notes>(context, listen: false)
                        .getDataFromDataBase(),
                    builder: (context, snapshot) => Expanded(
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemCount: _notes.length,
                        itemBuilder: (BuildContext context, int index) =>
                            GridItem(
                          g_content: _notes[index].content,
                          g_dateTime: _notes[index].dateTime,
                          g_id: _notes[index].id,
                          g_title: _notes[index].title,
                        ),
                        staggeredTileBuilder: (int index) {
                          if (_notes[index].title.length >= 100) {
                            return StaggeredTile.count(4, 1.4);
                          }
                          if (_notes[index].title.length < 100 &&
                              _notes[index].title.length >= 50) {
                            return StaggeredTile.count(2, 2.41);
                          } else {
                            return StaggeredTile.count(2, 1.2);
                          }
                        },
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      ),
                    ),
                  )
                : Expanded(
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      itemCount: _filteredNores.length,
                      itemBuilder: (BuildContext context, int index) =>
                          GridItem(
                        g_content: _filteredNores[index].content,
                        g_dateTime: _filteredNores[index].dateTime,
                        g_id: _filteredNores[index].id,
                        g_title: _filteredNores[index].title,
                      ),
                      staggeredTileBuilder: (int index) {
                        if (_filteredNores[index].title.length >= 100) {
                          return StaggeredTile.count(4, 1.4);
                        }
                        if (_filteredNores[index].title.length < 100 &&
                            _filteredNores[index].title.length >= 50) {
                          return StaggeredTile.count(2, 2.41);
                        } else {
                          return StaggeredTile.count(2, 1.2);
                        }
                      },
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
