import 'package:flutter/material.dart';
import 'package:music_player/componets/new_box.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        // get the playlist
        final playlist = value.playlist;

        //get the current song
        final currentSong = playlist[value.currentSongIndex ?? 0];
        // return scaffold ui
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //app bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //back button
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      //tittle
                      const Text('P L A Y L I S T'),
                      //menu button
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //album artwork
                  //image
                  NewBox(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(currentSong.albumImagePath),
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //song name and artist name
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentSong.songName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Text(currentSong.artistName),
                              ],
                            ),

                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //song duration progress
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //start time
                            Text('0:00'),
                            //shuffle icon
                            Icon(Icons.shuffle),
                            //repeat icon
                            Icon(Icons.repeat),
                            // end time
                            Text('0:00'),
                          ],
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 6)),
                        child: Slider(
                          min: 0,
                          max: 100,
                          value: 50,
                          activeColor: Colors.green,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),

                  //playback controls
                  Row(
                    children: [
                      //skip previous
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: NewBox(
                            child: Icon(Icons.skip_previous),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      //play pause
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {},
                          child: NewBox(
                            child: Icon(Icons.play_arrow),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      //skip forward
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: NewBox(
                            child: Icon(Icons.skip_next),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
