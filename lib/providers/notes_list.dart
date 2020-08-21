import 'package:flutter/material.dart';
import 'package:http_test/helpers/db_helper.dart';

class Note {
  String id;
  String title;
  String content;
  DateTime dateTime;
  Note(this.id, this.title, this.content, this.dateTime);
}

class Notes with ChangeNotifier {
  List<Note> _notes = [];
  List<Note> _filteredNotes = [];

  List<Note> get notes {
    return [..._notes];
  }

  List<Note> get filteredNotes {
    return [..._filteredNotes];
  }

  addNote(String id, String title, String content, DateTime dateTime) {
    _notes.add(Note(id, title, content, dateTime));
    notifyListeners();
    DBHelper.insert('user_notes', {
      'id': id,
      'title': title,
      'content': content,
      'datetime': dateTime.toString(),
    });
  }

  deleteNote(String id) {
    _notes.removeWhere((element) => element.id == id);
    notifyListeners();
    DBHelper.deleteItemFromDatabase('user_notes', id);
  }

  updateNote(String id, String newTitle, String newContent, DateTime datetime) {
    var n = _notes.firstWhere((element) => element.id == id);
    var note = Note(id, newTitle, newContent, datetime);
    n.title = newTitle;
    n.content = newContent;
    notifyListeners();
    DBHelper.updateItemInDataBase(note, 'user_notes');
  }

  Future<void> getDataFromDataBase() async {
    final storedData = await DBHelper.getData('user_notes');
    _notes = storedData
        .map((e) => Note(
              e['id'],
              e['title'],
              e['content'],
              DateTime.parse(e['datetime']),
            ))
        .toList();
    notifyListeners();
  }
}
