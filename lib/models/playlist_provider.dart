import 'package:flutter/cupertino.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [
    Song(
        songName: "All I Ask",
        artistName: "Adele",
        albumImagePath: "assets/images/adele.jpg",
        audioPath: "assets/audio/All I Ask.mp3",),
    Song(
        songName: "Hello",
        artistName: "Adele",
        albumImagePath: "assets/images/adele.jpg",
        audioPath: "assets/audio/All I Ask.mp3"),
    Song(
        songName: "Riverlea",
        artistName: "Adele",
        albumImagePath: "assets/images/adele.jpg",
        audioPath: "assets/audio/All I Ask.mp3"),
  ];
  // current song playing index
  int? _currentSongIndex;
  // GETTERS
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;


  //SETTERS
}

