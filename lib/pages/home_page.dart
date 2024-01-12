import 'package:flutter/material.dart';
import 'package:music_player/componets/my_drawer.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:music_player/models/song.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Center(child: Text('P L A Y L I S T')),
      ),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          //get the playlist
          final List<Song> playlist = value.playlist;
          return ListView.builder(
              itemBuilder: (context, index) => ListTile()
          );

        }
      ),
    );
  }
}
