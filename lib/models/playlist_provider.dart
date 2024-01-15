import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [

    Song(
        songName: "All I Ask",
        artistName: 'Adele',
        albumImagePath: 'assets/images/adele.jpg',
        audioPath: 'audio/All I Ask.mp3'
    ),
    Song(
        songName: "Hello",
        artistName: 'Adele',
        albumImagePath: 'assets/images/adele.jpg',
        audioPath: 'audio/01. Hello.mp3'
    ),
    Song(
        songName: "River Lea",
        artistName: 'Adele',
        albumImagePath: 'assets/images/adele.jpg',
        audioPath: 'audio/07. River Lea.mp3'
    ),

  ];

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
    await _audioPlayer.play(AssetSource(path)); //play new song
    _isPlaying = true;
    notifyListeners();
  }
  //pause current song
  void pause() async{
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
    if(_isPlaying) {
      pause();
    }else {
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
    if (_currentSongIndex != null ) {
      if (_currentSongIndex! < _playlist.length -1) {
        //go to the next song is its not the last
        currentSongIndex = _currentSongIndex! +1;
      }else {
        //if its the last song loop back to the first song
        currentSongIndex = 0;
      }
    }
  }
  //play previous song
  void playPreviousSong() async {
    //if more than 2sec have passed restart the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    }
    //if its within 2sec of the song go to the previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! -1;
      } else {
        currentSongIndex = _playlist.length -1;
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
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
    
  }
  //dispose audio player

  // GETTERS
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  //SETTERS
  set currentSongIndex(int? newIndex) {
    //update current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play(); // play the song at the new index
    }
    //updates UI
    notifyListeners();
  }

}

