import 'package:flutter/material.dart';
import 'package:flutter_music_appl/models/songs.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [
    //song1
    Song(
        songName: "Ram Siya Ram",
        artistName: "Sachet Tandon",
        albumartImagePath: "assets/images/ram.jpg",
        audioPath: "songs/_Ram Siya Ram.mp3"),
    //song2
    Song(
        songName: "Arjan Vailly, Animal",
        artistName: "Adjjxn",
        albumartImagePath: "assets/images/arvally.jpg",
        audioPath: "songs/Arjan Vailly.mp3"),
    //song3
    Song(
        songName: "Eenie Meenie",
        artistName: "Justin Bieber",
        albumartImagePath: "assets/images/justinbbr.jpg",
        audioPath: "songs/Eenie Meenie.mp3"),
    //song4
    Song(
        songName: "Kesariya isku",
        artistName: "arjit Singh",
        albumartImagePath: "assets/images/kesariya.jpg",
        audioPath: "songs/Kesariya.mp3"),
    //song5
    Song(
        songName: "Pehle Bhi Main, Animal",
        artistName: "BBBBBB",
        albumartImagePath: "assets/images/arvally.jpg",
        audioPath: "songs/Pehle Bhi Main.mp3"),
    //song6
    Song(
      songName: "Saari Duniya, Animal",
      artistName: "SSSSS",
      albumartImagePath: "assets/images/arvally.jpg",
      audioPath: "songs/Saari Duniya.mp3",
    ),
  ];

  //current song playing index
  int? _currentSongIndex;
  // getters
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  // setters
  set currentSongIndex(int? newIndex) {
    //update current song index
    _currentSongIndex = newIndex;
    //update the UI
    notifyListeners();
  }
}
