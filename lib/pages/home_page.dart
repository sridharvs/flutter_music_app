import 'package:flutter/material.dart';
import 'package:flutter_music_appl/components/my_drawer.dart';
import 'package:flutter_music_appl/components/playlist_provider.dart';
import 'package:flutter_music_appl/models/songs.dart';
import 'package:flutter_music_appl/pages/songpage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get the playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //get play provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  //go to a song
  void goToSong(int songIndex) {
    //update current song index
    playlistProvider.currentSongIndex = songIndex;
    //navigate to song page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "M U S I C",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 238, 82),
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: Consumer<PlaylistProvider>(builder: (context, value, child) {
        //get the playlist
        final List<Song> playlist = value.playlist;

        //return the listview UI
        return ListView.builder(
          itemCount: playlist.length,
          itemBuilder: (context, index) {
            //get individual song
            final Song song = playlist[index];
            return ListTile(
              title: Text(song.songName),
              subtitle: Text(song.artistName),
              leading: Image.asset(song.albumartImagePath),
              onTap: () => goToSong(index),
            );
          },
        );
      }),
    );
  }
}
