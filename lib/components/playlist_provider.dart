import 'package:audioplayers/audioplayers.dart';
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

  //AUDIOPLAYERS
  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();
  //duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;
  //contructor
  PlaylistProvider() {
    listenToDuration();
  }
  //initilally not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); //stop the current song
    await _audioPlayer.play(AssetSource(path)); //play the new song
    _isPlaying = true;
    notifyListeners();
  }

  //pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        //go to the next song if it's not a last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        //if it's a last song, loop to the first song
        currentSongIndex = 0;
      }
    }
  }

  //play previuos song
  void playPreviousSong() async {
    //if more than 2sec have passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    }
    //else its within 2sec of the song, go to previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        //if its the first song, loop back to last song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  //listen to duration
  void listenToDuration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });
    //listen for current duration
    _audioPlayer.onDurationChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }
  //dispose audio player

  // getters
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  // setters
  set currentSongIndex(int? newIndex) {
    //update current song index
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play(); //play the song at the new index
    }
    //update the UI
    notifyListeners();
  }
}
