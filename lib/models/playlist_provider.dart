import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [];

  // current song playing index
  int? _currentSongIndex;

  /* AUDIOpLAYER */
  //AUDIO PLAYER
  final AudioPlayer  _audioPlayer = AudioPlayer();

  //durations
    Duration _currentDuration = Duration.zero;
    Duration _totalDuration = Duration.zero;
  //constructor
  PlaylistProvider(){
    listenToDuration();
  }
  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // play current song
    await _audioPlayer.play(AssetSource(path)); // 
  }
  //pause current song
  //resume playing
  //pause or resume
  //seek to a specific position in the current song
  //play next song
  //play previous song
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
    _audioPlayer.onPlayerComplete.listen((event) { });
    
  }
  //dispose audio player

  // GETTERS
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  //SETTERS
  set currentSongIndex(int? newIndex) {
    //update current song index
    _currentSongIndex = newIndex;

    //updates UI
    notifyListeners();
  }

}

